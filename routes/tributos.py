from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()

# variable
@subapp.route('/', method='GET')
def tributo():
  conn = engine.connect()
  stmt = text(("SELECT * FROM tributo").format())
  rows = conn.execute(stmt)

  locals = {'tributos_data': rows}
  return template('tributos/tributos', locals)

#Borrar variable
@subapp.route('/delete', method='GET')
def tributo_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM tributo WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/tributos")


#Crear variable
@subapp.route('/new', method='GET')
def tributo_new():
  # acceso a db
  tributos_data = (0, "","","","","","",0)
  conn = engine.connect()
  stmt = text(("SELECT * FROM factura").format())
  facturas_data = conn.execute(stmt)
  factura_id = 0
  conn.close()
  locals = {'tributos_data': tributos_data, 'id': 0, 'factura_id' : factura_id, 'facturas_data' : facturas_data}
  return template('tributos/tributos_new', locals)

#Guardar variable
@subapp.route('/save', method='POST')
def tributo_save():
  factura_id = request.forms.get('factura_id')
  valor_de_venta = float(request.forms.get('valor_de_venta'))
  otros_tributos = int(request.forms.get('otros_tributos'))
  isc = float(request.forms.get('isc'))
  icbper = float(request.forms.get('icbper'))
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    importe_total = (valor_de_venta * 1.18) + otros_tributos + isc + icbper
    stmt = text(
      ("INSERT INTO tributo (valor_de_venta,igv,otros_tributos,isc,icbper,importe_total,factura_id) VALUES ('{}','{}','{}','{}','{}','{}','{}')").format(valor_de_venta,valor_de_venta*0.18,otros_tributos,isc,icbper,importe_total,factura_id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/tributos")