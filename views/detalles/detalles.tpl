<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles</title>
    % include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Lista de Detalles</h1>
        <table id="detallesTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Servicio</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                    <th>ID de factura</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for detalle in detalles_data:
                <tr>
                    <td>{{detalle[0]}}</td>
                    <td>{{detalle[4]}}</td>
                    <td>{{detalle[1]}}</td>
                    <td>{{detalle[2]}}</td>
                    <td>{{detalle[3]}}</td>

                    <td>
                    <a href="/detalles/edit?id={{detalle[0]}}" class="btn">Editar</a>
                    <a href="/detalles/delete?id={{detalle[0]}}" class="btn">Eliminar</a>
                    </td> 
                </tr>
                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>