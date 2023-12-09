from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()

# variable
@subapp.route('/', method='GET')
def unidad():
  conn = engine.connect()
  stmt = text(("SELECT * FROM unidad_medida").format())
  rows = conn.execute(stmt)
  locals = {'unidades_data': rows}
  return template('unidades/unidades', locals)


#Editar variable
@subapp.route('/edit', method='GET')
def unidad_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM unidad_medida WHERE id = {}").format(id))
  unidades_data = conn.execute(stmt).fetchone()
  conn.close()
  locals = {'unidades_data': unidades_data, 'id': id}
  return template('unidades/unidades_edit', locals)


#Borrar variable
@subapp.route('/delete', method='GET')
def unidad_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM unidad_medida WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/unidades")


#Crear variable
@subapp.route('/new', method='GET')
def unidad_new():
  # acceso a db
  unidades_data = (0, "")
  locals = {'unidades_data': unidades_data, 'id': 0}
  return template('unidades/unidades_new', locals)


#Guardar variable
@subapp.route('/save', method='POST')
def unidad_save():
  nombre = request.forms.get('nombre')
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    stmt = text(
      ("INSERT INTO unidad_medida (nombre) VALUES ('{}')").format(nombre))
  else:
    stmt = text(
      ("UPDATE unidad_medida SET nombre = '{}' WHERE id = {}").format(nombre, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/unidades")