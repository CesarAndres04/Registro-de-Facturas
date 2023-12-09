from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()


#variable
@subapp.route('/', method='GET')
def emisor():
  # acceso a db
  conn = engine.connect()
  stmt = text((
    "SELECT E.id, E.nombre,E.fecha_de_emision, E.ruc, DI.nombre AS distrito_nombre FROM emisor E INNER JOIN distrito DI ON E.distrito_id = DI.id"
  ).format())
  rows = conn.execute(stmt)
  conn.close()
  locals = {'emisores_data': rows}
  return template('emisores/emisores', locals)


#Editar variable
@subapp.route('/edit', method='GET')
def emisor_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM emisor WHERE id = {}").format(id))
  emisores_data = conn.execute(stmt).fetchone()
  stmt = text(("SELECT * FROM distrito").format())
  distritos_data = conn.execute(stmt)
  conn.close()
  locals = {'emisores_data': emisores_data,'id': id,'distritos_data': distritos_data}
  return template('emisores/emisores_edit', locals)


#Borrar variable
@subapp.route('/delete', method='GET')
def emisor_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM emisor WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/emisores")


#Crear variable
@subapp.route('/new', method='GET')
def emisor_new():
  # acceso a db
  emisores_data = (0, "", "","","")
  conn = engine.connect()
  stmt = text(("SELECT * FROM distrito").format())
  distritos_data = conn.execute(stmt)
  conn.close()
  locals = {'emisores_data': emisores_data,'id': id,'distritos_data': distritos_data}
  return template('emisores/emisores_new', locals)


#Guardar variable
@subapp.route('/save', method='POST')
def emisor_save():
  distrito_id = int(request.forms.get('distrito_id'))
  fecha_de_emision = request.forms.get('fecha_de_emision')
  ruc = request.forms.get('ruc')
  nombre = request.forms.get('nombre')
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    stmt = text((
      "INSERT INTO emisor (nombre, fecha_de_emision, ruc,distrito_id) VALUES ('{}','{}','{}',{})"
    ).format(nombre, fecha_de_emision,ruc, distrito_id))
  else:
    stmt = text((
      "UPDATE emisor SET nombre = '{}', fecha_de_emision = '{}', ruc = '{}', distrito_id ={} WHERE id = {}"
    ).format(nombre, fecha_de_emision,ruc, distrito_id, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/emisores")