from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()

# variable
@subapp.route('/', method='GET')
def medio_pago():
  conn = engine.connect()
  stmt = text(("SELECT * FROM medio_pago").format())
  rows = conn.execute(stmt)
  locals = {'pagos_data': rows}
  return template('pagos/pagos', locals)


#Editar variable
@subapp.route('/edit', method='GET')
def medio_pago_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM medio_pago WHERE id = {}").format(id))
  pagos_data = conn.execute(stmt).fetchone()
  conn.close()
  locals = {'pagos_data': pagos_data, 'id': id}
  # respuesta
  return template('pagos/pagos_edit', locals)


#Borrar variable
@subapp.route('/delete', method='GET')
def medio_pago_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM medio_pago WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  # respuesta
  return redirect("/pagos")


#Crear variable
@subapp.route('/new', method='GET')
def medio_pago_new():
  # acceso a db
  pagos_data = (0, "")
  locals = {'pagos_data': pagos_data, 'id': 0}
  return template('pagos/pagos_new', locals)


#Guardar variable
@subapp.route('/save', method='POST')
def medio_pago_save():
  nombre = request.forms.get('nombre')
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    stmt = text(
      ("INSERT INTO medio_pago (nombre) VALUES ('{}')").format(nombre))
  else:
    stmt = text(
      ("UPDATE medio_pago SET nombre = '{}' WHERE id = {}").format(nombre, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/pagos")