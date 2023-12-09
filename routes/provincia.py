from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()


# variable
@subapp.route('/', method='GET')
def provincia():
  # acceso a db
  conn = engine.connect()
  stmt = text((
    "SELECT P.id, P.nombre, D.nombre AS departamento_nombre FROM provincia P INNER JOIN departamento D ON P.departamento_id = D.id"
  ).format())
  rows = conn.execute(stmt)
  conn.close()
  locals = {'provincias_data': rows}
  # respuesta
  return template('provincias/provincias', locals)


#Editar variable
@subapp.route('/edit', method='GET')
def provincia_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM provincia WHERE id = {}").format(id))
  provincias_data = conn.execute(stmt).fetchone()
  stmt = text(("SELECT * FROM departamento").format())
  departamentos_data = conn.execute(stmt)
  conn.close()
  locals = {'provincias_data': provincias_data,'id': id,'departamentos_data': departamentos_data}
  return template('provincias/provincias_edit', locals)


#Borrar variable
@subapp.route('/delete', method='GET')
def provincia_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM provincia WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/provincias")


#Crear variable
@subapp.route('/new', method='GET')
def provincia_new():
  # acceso a db
  provincias_data = (0, "", "")
  conn = engine.connect()
  stmt = text(("SELECT * FROM departamento").format())
  departamentos_data = conn.execute(stmt)
  conn.close()
  locals = {'provincias_data': provincias_data,'id': id,'departamentos_data': departamentos_data}
  return template('provincias/provincias_new', locals)


#Guardar variable
@subapp.route('/save', method='POST')
def provincia_save():
  departamento_id = int(request.forms.get('departamento_id'))
  nombre = request.forms.get('nombre')
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    stmt = text((
      "INSERT INTO provincia (nombre, departamento_id) VALUES ('{}',{})"
    ).format(nombre, departamento_id))
  else:
    stmt = text((
      "UPDATE provincia SET nombre = '{}', departamento_id ={} WHERE id = {}"
    ).format(nombre, departamento_id, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/provincias")
