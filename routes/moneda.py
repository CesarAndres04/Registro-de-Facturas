from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()

#variable
@subapp.route('/', method='GET')
def moneda():
  conn = engine.connect()
  stmt = text(("SELECT * FROM tipo_moneda").format())
  rows = conn.execute(stmt)
  locals = {'monedas_data': rows}
  return template('monedas/monedas', locals)


#Editar variable
@subapp.route('/edit', method='GET')
def moneda_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM tipo_moneda WHERE id = {}").format(id))
  monedas_data = conn.execute(stmt).fetchone()
  conn.close()
  locals = {'monedas_data': monedas_data, 'id': id}
  return template('monedas/monedas_edit', locals)


#Borrar variable
@subapp.route('/delete', method='GET')
def moneda_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM tipo_moneda WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/monedas")


#Crear variable
@subapp.route('/new', method='GET')
def moneda_new():
  # acceso a db
  monedas_data = (0, "")
  locals = {'monedas_data': monedas_data, 'id': 0}
  return template('monedas/monedas_new', locals)


#Guardar variable
@subapp.route('/save', method='POST')
def moneda_save():
  nombre = request.forms.get('nombre')
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    # crear
    stmt = text(
      ("INSERT INTO tipo_moneda (nombre) VALUES ('{}')").format(nombre))
  else:
    stmt = text(
      ("UPDATE tipo_moneda SET nombre = '{}' WHERE id = {}").format(nombre, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/monedas")