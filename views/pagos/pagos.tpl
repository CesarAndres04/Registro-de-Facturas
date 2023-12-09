<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Métodos de Pago</title>
% include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Métodos de Pago</h1>
        <a href="/pagos/new" class="btn">Agregar Metodo de pago</a><br><br>
        <table id="pagoMethodsTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for pago in pagos_data:
                <tr>
                    <td>{{pago[0]}}</td>
                    <td>{{pago[1]}}</td>
                    <td>
                    <a href="/pagos/edit?id={{pago[0]}}" class="btn">Editar</a>
                    <a href="/pagos/delete?id={{pago[0]}}" class="btn">Eliminar</a>
                    </td> 
                </tr>

                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>
