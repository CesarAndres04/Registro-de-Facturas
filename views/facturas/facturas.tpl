<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facturas</title>
    % include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Lista de Facturas</h1>
        <a href="/facturas/new" class="btn">Agregar Factura</a><br><br>
        <table id="emittersTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Codigo</th>
                    <th>Observación</th>
                    <th>Fecha</th>
                    <th>Monto Total</th>
                    <th>Moneda</th>
                    <th>Emisor</th>
                    <th>Receptor</th>
                    <th>Medio de pago</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % i = 0
                % for factura in facturas_data:
                <tr>
                <td><b>{{factura[0]}}</b></td>
                <td><b>{{factura[1]}}</b></td>
                <td><b>{{factura[3]}}</b></td>
                <td><b>{{factura[4]}}</b></td>
                <td><b>{{round(factura[2],2)}}</b></td>
                <td><b>{{factura[5]}}</b></td>
                <td><b>{{factura[6]}}</b></td>
                <td><b>{{factura[7]}}</b></td>
                <td><b>{{factura[8]}}</b></td>
                    <td>
                    <a href="/detalles/new?factura_id={{factura[0]}}" class="btn">Agregar servicio</a>
                    <a href="/facturas/edit?id={{factura[0]}}" class="btn">Editar</a>
                    <a href="/facturas/delete?id={{factura[0]}}" class="btn">Eliminar</a>
                    <a href="/facturas/update?id={{factura[0]}}" class="btn">Actualizar Monto</a>
                    </td> 
                </tr>
                % j = 0

                % for detalle in detalles_data[i]:

                % if j == 0:
                    <tr>
                    <td></td>
                    <td><u></u></td>
                    <td><u>Servicio</u></td>
                    <td><u>Cantidad</u></td>
                    <td><u>Total</u></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    </tr>
                % end
                % j = j+1

                <tr>
                    <td></td>
                    <td></td>
                    <td>{{detalle[4]}}</td>
                    <td>{{detalle[1]}}</td>
                    <td>{{round(detalle[2],2)}}</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                    <a href="/detalles/edit?id={{detalle[0]}}" class="btn">Editar</a>
                    <a href="/detalles/delete?id={{detalle[0]}}" class="btn">Eliminar</a>
                    </td>
                </tr>
                % end
                % i = i + 1
            % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>