from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()


#Variable
@subapp.route('/', method='GET')
def facturas():
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT F.id, F.numero, F.total, F.observacion, F.fecha,  T.nombre as moneda_nombre, E.nombre as emisor_nombre, R.nombre as receptor_nombre, M.nombre as medio_nombre FROM factura F INNER JOIN tipo_moneda T ON F.tipo_moneda_id = T.id INNER JOIN emisor E ON F.emisor_id = E.id INNER JOIN receptor R ON F.receptor_id = R.id INNER JOIN medio_pago M ON F.medio_pago_id = M.id").format())
  rows = conn.execute(stmt)
  detalles_data = []
  for row in rows:
    stmt2 = text(("SELECT D.id, D.cantidad, D.total, D.factura_id, S.descripcion as servicio_nombre FROM detalle D INNER JOIN servicio S ON D.servicio_id = S.id WHERE factura_id = {}").format(row[0]))
    respuesta = conn.execute(stmt2)
    detalles_data.append(respuesta)
  rows = conn.execute(stmt)
  conn.close()
  locals = {'facturas_data': rows, 'detalles_data': detalles_data}
  return template('facturas/facturas', locals)


#Editar variable
@subapp.route('/edit', method='GET')
def facturas_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM factura WHERE id = {}").format(id))
  facturas_data = conn.execute(stmt).fetchone()
  stmt = text(("SELECT * FROM tipo_moneda").format())
  monedas_data = conn.execute(stmt)
  stmt = text(("SELECT * FROM emisor").format())
  emisores_data = conn.execute(stmt)
  stmt = text(("SELECT * FROM receptor").format())
  receptores_data = conn.execute(stmt)
  stmt = text(("SELECT * FROM medio_pago").format())
  pagos_data = conn.execute(stmt)
  conn.close()
  locals = {'facturas_data': facturas_data, 'id': id, 'monedas_data': monedas_data, 'emisores_data': emisores_data, 'receptores_data': receptores_data, 'pagos_data':pagos_data}
  return template('facturas/facturas_edit', locals)


#Borrar variable
@subapp.route('/delete', method='GET')
def facturas_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM factura WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/facturas")


# Crear variable
@subapp.route('/new', method='GET')
def facturas_new():
  # acceso a db
  facturas_data = (0, "", "", "", "", "", "","","")
  conn = engine.connect()
  stmt = text(("SELECT * FROM tipo_moneda").format())
  monedas_data = conn.execute(stmt)
  stmt = text(("SELECT * FROM emisor").format())
  emisores_data = conn.execute(stmt)
  stmt = text(("SELECT * FROM receptor").format())
  receptores_data = conn.execute(stmt)
  stmt = text(("SELECT * FROM medio_pago").format())
  pagos_data = conn.execute(stmt)
  conn.close()
  locals = {'facturas_data': facturas_data,'id': 0,'monedas_data': monedas_data,'emisores_data': emisores_data,'receptores_data': receptores_data,'pagos_data': pagos_data}
  return template('facturas/facturas_new', locals)

# Actualizar monto
@subapp.route('/update', method='GET')
def facturas_update():
    id = int(request.query.id)
    conn = engine.connect()
    stmt_total = text(("SELECT SUM(total) FROM detalle WHERE factura_id = {}").format(id))
    total_detalle = conn.execute(stmt_total).scalar() or 0
    stmt = text((
        "UPDATE factura SET total ={} WHERE id = {}").format(total_detalle, id))
    conn.execute(stmt)
    conn.commit()
    conn.close()
    
    return redirect('/facturas')


# Guardar variable
@subapp.route('/save', method='POST')
def facturas_save():
  tipo_moneda_id = int(request.forms.get('tipo_moneda_id'))
  fecha = request.forms.get('fecha')
  numero = request.forms.get('numero')
  observacion = request.forms.get('observacion')
  emisor_id = int(request.forms.get('emisor_id'))
  receptor_id = int(request.forms.get('receptor_id'))
  medio_pago_id = int(request.forms.get('medio_pago_id'))
  total = 0
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
      stmt = text((
          "INSERT INTO factura (numero, total, observacion, fecha, tipo_moneda_id, emisor_id, receptor_id, medio_pago_id) VALUES ('{}',{},'{}','{}',{},{},{},{})"
        ).format(numero, total, observacion, fecha, tipo_moneda_id, emisor_id, receptor_id, medio_pago_id))
  else:
      stmt = text((
        "UPDATE factura SET numero= '{}', observacion = '{}', fecha = '{}', tipo_moneda_id = {}, emisor_id = {}, receptor_id = {}, medio_pago_id = {} WHERE id = {}"
        ).format(numero, observacion, fecha, tipo_moneda_id, emisor_id, receptor_id, medio_pago_id, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect('/facturas')