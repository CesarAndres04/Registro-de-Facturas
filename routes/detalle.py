from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()


#Variable
@subapp.route('/', method='GET')
def detalles():
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT D.id, D.cantidad, D.total, D.factura_id, S.descripcion as servicio FROM detalle D INNER JOIN servicio S ON D.servicio_id = S.id").format())
  rows = conn.execute(stmt)
  conn.close()
  locals = {'detalles_data': rows}
  return template('detalles/detalles', locals)


@subapp.route('/new', method='GET')
def detalles_new():
  # acceso a db
  detalles_data = (0, 0, 0, 0)
  factura_id = int(request.params.factura_id)
  conn = engine.connect()
  stmt = text(("SELECT * FROM servicio").format())
  servicios_data = conn.execute(stmt)
  stmt = text(("SELECT * FROM factura").format())
  facturas_data = conn.execute(stmt)
  conn.close()
  locals = {'id': 0,'factura_id': factura_id,'facturas_data': facturas_data,'servicios_data': servicios_data,'detalles_data': detalles_data,}
  return template('detalles/detalles_new', locals)


@subapp.route('/save', method='POST')
def detalles_save():
  factura_id = request.forms.get('factura_id')
  cantidad = request.forms.get('cantidad')
  servicio_id = request.forms.get('servicio_id')
  total = request.forms.get('total')
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    stmt = text((
      "INSERT INTO detalle (cantidad, total, factura_id, servicio_id) VALUES ({}, {}, {}, {})"
    ).format(cantidad, total, factura_id, servicio_id))
  else:
    stmt = text((
      "UPDATE detalle SET cantidad = {}, total={}, factura_id={}, servicio_id={} WHERE id = {}"
    ).format(cantidad, total, factura_id, servicio_id, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/facturas")


@subapp.route('/edit', method='GET')
def detalles_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM detalle WHERE id = {}").format(id))
  detalles_data = conn.execute(stmt).fetchone()
  stmt = text(("SELECT * FROM factura").format())
  facturas_data = conn.execute(stmt)
  stmt = text(("SELECT * FROM servicio").format())
  servicios_data = conn.execute(stmt)
  factura_id = 0
  conn.close()
  locals = {'detalles_data': detalles_data,'factura_id': factura_id,'id': id,'servicios_data': servicios_data, 'facturas_data': facturas_data}
  return template('detalles/detalles_edit', locals)

@subapp.route('/delete', method='GET')
def detalles_delete():
  id = int(request.params.id)
  conn = engine.connect()
  stmt = text(("DELETE FROM detalle WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/facturas")