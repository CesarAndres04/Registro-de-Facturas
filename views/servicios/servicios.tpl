<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Servicios</title>
% include('tabla.tpl')

</head>

<body>
    <div class="content-container">
        <h1>Servicios</h1>
        <a href="/servicios/new" class="btn">Agregar Servicio</a><br><br>
        <table id="servicioTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Descripción</th>
                    <th>Valor Unitario</th>
                    <th>Unidad de Medida</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for servicio in servicios_data:
                <tr>
                    <td>{{servicio[0]}}</td>
                    <td>{{servicio[1]}}</td>
                    <td>{{servicio[2]}}</td>
                    <td>{{servicio[3]}}</td>
                    <td>
                    <a href="/servicios/edit?id={{servicio[0]}}" class="btn">Editar</a>
                    <a href="/servicios/delete?id={{servicio[0]}}" class="btn">Eliminar</a>
                    </td> 
                </tr>
                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>
