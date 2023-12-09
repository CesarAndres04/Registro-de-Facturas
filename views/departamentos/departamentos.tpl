<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Departamentos</title>
% include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Lista de Departamentos</h1>
        <a href="/departamentos/new" class="btn">Agregar Departamento</a><br><br>
        <table id="departamentosTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for departamento in departamentos_data:
                <tr>
                    <td>{{departamento[0]}}</td>
                    <td>{{departamento[1]}}</td>
                    <td>
                    <a href="/departamentos/edit?id={{departamento[0]}}" class="btn">Editar</a>
                    <a href="/departamentos/delete?id={{departamento[0]}}" class="btn">Eliminar</a>
                    </td>   
                <tr>                 
                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>
