from bottle import Bottle, run, template, request, redirect
from sqlalchemy import text
from database import engine

subapp = Bottle()


#Variable
@subapp.route('/', method='GET')
def servicio():
  # acceso a db
  conn = engine.connect()
  stmt = text((
    "SELECT S.id, S.descripcion, S.valor_unitario, U.nombre AS unidad_nombre FROM servicio S INNER JOIN unidad_medida U ON S.unidad_medida_id = U.id"
  ).format())
  rows = conn.execute(stmt)
  conn.close()
  locals = {'servicios_data': rows}
  return template('servicios/servicios', locals)


#Editar variable
@subapp.route('/edit', method='GET')
def servicio_edit():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("SELECT * FROM servicio WHERE id = {}").format(id))
  servicios_data = conn.execute(stmt).fetchone()
  stmt = text(("SELECT * FROM unidad_medida").format())
  unidades_data = conn.execute(stmt)
  conn.close()
  locals = {'servicios_data': servicios_data,'id': id,'unidades_data': unidades_data}
  return template('servicios/servicios_edit', locals)


#Borrar variable
@subapp.route('/delete', method='GET')
def servicio_delete():
  id = int(request.params.id)
  # acceso a db
  conn = engine.connect()
  stmt = text(("DELETE FROM servicio WHERE id = {}").format(id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/servicios")


#Crear variable
@subapp.route('/new', method='GET')
def servicio_new():
  # acceso a db
  servicios_data = (0, "", "","")
  conn = engine.connect()
  stmt = text(("SELECT * FROM unidad_medida").format())
  unidades_data = conn.execute(stmt)
  conn.close()
  locals = {'servicios_data': servicios_data,'id': id,'unidades_data': unidades_data}
  return template('servicios/servicios_new', locals)


#Guardar variable
@subapp.route('/save', method='POST')
def servicio_save():
  unidad_medida_id = int(request.forms.get('unidad_medida_id'))
  descripcion = request.forms.get('descripcion')
  valor_unitario = float(request.forms.get('valor_unitario'))
  id = int(request.forms.get('id'))
  # acceso a db
  conn = engine.connect()
  if id == 0:
    stmt = text((
      "INSERT INTO servicio (descripcion,valor_unitario, unidad_medida_id) VALUES ('{}',{},{})"
    ).format(descripcion,valor_unitario, unidad_medida_id))
  else:
    stmt = text((
      "UPDATE servicio SET  descripcion = '{}', valor_unitario = {}, unidad_medida_id ={} WHERE id = {}"
    ).format(descripcion,valor_unitario, unidad_medida_id, id))
  conn.execute(stmt)
  conn.commit()
  conn.close()
  return redirect("/servicios")