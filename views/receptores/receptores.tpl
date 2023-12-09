<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receptores</title>
 % include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Receptores</h1>
        <a href="/receptores/new" class="btn">Agregar Receptor</a><br><br>
        <table id="receptorTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>RUC</th>
                    <th>Distrito</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for receptor in receptores_data:
                <tr>
                    <td>{{receptor[0]}}</td>
                    <td>{{receptor[1]}}</td>
                    <td>{{receptor[2]}}</td>
                    <td>{{receptor[3]}}</td>
                    <td>
                    <a href="/receptores/edit?id={{receptor[0]}}" class="btn">Editar</a>
                    <a href="/receptores/delete?id={{receptor[0]}}" class="btn">Eliminar</a>
                    </td> 
                </tr>
                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>
