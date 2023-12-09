from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()


#variable
@subapp.route('/', method='GET')
def distrito():
  # acceso a db
  conn = engine.connect()
  stmt = text((
    "SELECT D.id, D.nombre, DI.nombre AS provincia_nombre FROM distrito D INNER JOIN provincia DI ON D.provincia_id = DI.id").format())
  rows = conn.execute(stmt)
  conn.close()
  locals = {'distritos_data': rows}
  return template('distritos/distritos', locals)


#editar variable
@subapp.route('/edit', method='GET')
def distrito_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM distrito WHERE id = {}").format(id))
  distritos_data = conn.execute(stmt).fetchone()
  stmt = text(("SELECT * FROM provincia").format())
  provincias_data = conn.execute(stmt)
  conn.close()
  locals = {'distritos_data': distritos_data,'id': id,'provincias_data': provincias_data}
  return template('distritos/distritos_edit', locals)


#Borrar variable
@subapp.route('/delete', method='GET')
def distrito_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM distrito WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/distritos")


#Crear variable
@subapp.route('/new', method='GET')
def distrito_new():
  # acceso a db
  distritos_data = (0, "", "")
  conn = engine.connect()
  stmt = text(("SELECT * FROM provincia").format())
  provincias_data = conn.execute(stmt)
  conn.close()
  locals = {'distritos_data': distritos_data,'id': id,'provincias_data': provincias_data}
  return template('distritos/distritos_new', locals)


#Guardar variable
@subapp.route('/save', method='POST')
def distrito_save():
  provincia_id = int(request.forms.get('provincia_id'))
  nombre = request.forms.get('nombre')
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    # crear
    stmt = text((
      "INSERT INTO distrito (nombre, provincia_id) VALUES ('{}',{})"
    ).format(nombre, provincia_id))
  else:
    # editar
    stmt = text((
      "UPDATE distrito SET nombre = '{}', provincia_id ={} WHERE id = {}"
    ).format(nombre, provincia_id, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/distritos")