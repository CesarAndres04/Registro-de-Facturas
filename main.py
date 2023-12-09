import os
import sqlite3
import datetime
from bottle import Bottle, run, template, static_file, request, redirect, post
from routes.departamentos import subapp as departamentos_app
from routes.tributos import subapp as tributos_app
from routes.moneda import subapp as moneda_app     
from routes.provincia import subapp as provincia_app  
from routes.distrito import subapp as distrito_app 
from routes.emisor import subapp as emisor_app 
from routes.receptor import subapp as receptor_app
from routes.unidad import subapp as unidad_app
from routes.metodo_pago import subapp as metodo_pago_app
from routes.servicio import subapp as servicio_app
from routes.detalle import subapp as detalle_app
from routes.factura import subapp as factura_app

app = Bottle()

@app.route('/', method='GET')
def home():

  return template('home')

@app.route('/:filename#.*#')
def send_static(filename):
  return static_file(filename, root='./views')

if __name__ == '__main__':
    app.mount('/departamentos', departamentos_app)
    app.mount('/tributos', tributos_app)
    app.mount('/monedas', moneda_app)
    app.mount('/provincias', provincia_app)
    app.mount('/distritos', distrito_app)
    app.mount('/emisores', emisor_app)
    app.mount('/receptores', receptor_app)
    app.mount('/unidades', unidad_app)
    app.mount('/pagos', metodo_pago_app)
    app.mount('/servicios', servicio_app)
    app.mount('/detalles',detalle_app )
    app.mount('/facturas', factura_app)
    run(app, host='0.0.0.0', port=8080, debug=True, reloader=True)
