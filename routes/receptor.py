from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()


#variable
@subapp.route('/', method='GET')
def receptor():
  # acceso a db
  conn = engine.connect()
  stmt = text((
    "SELECT R.id, R.nombre, R.ruc, DI.nombre AS distrito_nombre FROM receptor R INNER JOIN distrito DI ON R.distrito_id = DI.id"
  ).format())
  rows = conn.execute(stmt)
  conn.close()
  locals = {'receptores_data': rows}
  return template('receptores/receptores', locals)


#Editar variable
@subapp.route('/edit', method='GET')
def receptor_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM receptor WHERE id = {}").format(id))
  receptores_data = conn.execute(stmt).fetchone()
  stmt = text(("SELECT * FROM distrito").format())
  distritos_data = conn.execute(stmt)
  conn.close()
  locals = {'receptores_data': receptores_data,'id': id,'distritos_data': distritos_data}
  return template('receptores/receptores_edit', locals)


#Borrar variable
@subapp.route('/delete', method='GET')
def receptor_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM receptor WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/receptores")


#Crear variable
@subapp.route('/new', method='GET')
def receptor_new():
  # acceso a db
  receptores_data = (0, "", "","")
  conn = engine.connect()
  stmt = text(("SELECT * FROM distrito").format())
  distritos_data = conn.execute(stmt)
  conn.close()
  locals = {'receptores_data': receptores_data,'id': id,'distritos_data': distritos_data}
  return template('receptores/receptores_new', locals)


#Guardar variable
@subapp.route('/save', method='POST')
def receptor_save():
  distrito_id = request.forms.get('distrito_id')
  ruc = request.forms.get('ruc')
  nombre = request.forms.get('nombre')
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    stmt = text((
      "INSERT INTO receptor (ruc,nombre, distrito_id) VALUES ('{}','{}',{})"
    ).format(ruc,nombre, distrito_id))
  else:
    stmt = text((
      "UPDATE receptor SET  ruc = '{}', nombre = '{}', distrito_id ={} WHERE id = {}"
    ).format(ruc,nombre, distrito_id, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/receptores")