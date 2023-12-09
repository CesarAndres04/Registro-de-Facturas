<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tributos</title>
% include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Lista de Tributos</h1>
        <a href="/tributos/new" class="btn">Agregar tributos</a><br><br>
        <table id="tributosTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Valor de venta</th>
                    <th>IGV</th>
                    <th>Otros Tributos</th>
                    <th>ISC</th>
                    <th>ICBPER</th>
                    <th>Importe Total</th>
                    <th>ID de Factura</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for tributo in tributos_data:
                <tr>
                    <td>{{tributo[0]}}</td>
                    <td>{{tributo[1]}}</td>
                    <td>{{tributo[2]}}</td>
                    <td>{{tributo[3]}}</td>
                    <td>{{tributo[4]}}</td>
                    <td>{{tributo[5]}}</td>
                    <td>{{tributo[6]}}</td>
                    <td>{{tributo[7]}}</td>
                    <td>
                    <a href="/tributos/delete?id={{tributo[0]}}" class="btn">Eliminar</a>
                    </td>   
                </tr>
                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>
