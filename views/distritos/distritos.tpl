<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Distritos</title>
% include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Lista de Distritos</h1>
        <a href="/distritos/new" class="btn">Agregar Distrito</a><br><br>
        <table id="distritosTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Provincia</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for distrito in distritos_data:
                <tr>
                    <td>{{distrito[0]}}</td>
                    <td>{{distrito[1]}}</td>
                    <td>{{distrito[2]}}</td>
                    <td>
                    <a href="/distritos/edit?id={{distrito[0]}}" class="btn">Editar</a>
                    <a href="/distritos/delete?id={{distrito[0]}}" class="btn">Eliminar</a>
                    </td> 
                </tr>
                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>
