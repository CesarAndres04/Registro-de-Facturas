<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Provincias</title>
% include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Lista de Provincias</h1>
        <a href="/provincias/new" class="btn">Agregar Provincia</a><br><br>
        <table id="provinciasTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Departamento</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for provincia in provincias_data:
                <tr>
                    <td>{{provincia[0]}}</td>
                    <td>{{provincia[1]}}</td>
                    <td>{{provincia[2]}}</td>
                    <td>
                    <a href="/provincias/edit?id={{provincia[0]}}" class="btn">Editar</a>
                    <a href="/provincias/delete?id={{provincia[0]}}" class="btn">Eliminar</a>
                    </td>   
                </tr>
                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>
