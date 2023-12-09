from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()


# Variable
@subapp.route('/', method='GET')
def departamento():
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM departamento").format())
  rows = conn.execute(stmt)
  locals = {'departamentos_data': rows}
  return template('departamentos/departamentos', locals)


#Editar variable
@subapp.route('/edit', method='GET')
def departamento_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM departamento WHERE id = {}").format(id))
  departamentos_data = conn.execute(stmt).fetchone()
  conn.close()
  locals = {'departamentos_data': departamentos_data, 'id': id}
  return template('departamentos/departamentos_edit', locals)


#Borrar variable
@subapp.route('/delete', method='GET')
def departamento_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM departamento WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/departamentos")


#Crear variable
@subapp.route('/new', method='GET')
def departamento_new():
  departamentos_data = (0, "")
  locals = {'departamentos_data': departamentos_data, 'id': 0}
  return template('departamentos/departamentos_new', locals)


#Guardar variable
@subapp.route('/save', method='POST')
def departamento_save():
  nombre = request.forms.get('nombre')
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    stmt = text(
        ("INSERT INTO departamento (nombre) VALUES ('{}')").format(nombre))
  else:
    stmt = text(("UPDATE departamento SET nombre = '{}' WHERE id = {}").format(
        nombre, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/departamentos")
