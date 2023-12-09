<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Emisores</title>
    % include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Emisores</h1>
        <a href="/emisores/new" class="btn">Agregar Emisor</a><br><br>
        <table id="emisoresTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Fecha de Emisión</th>
                    <th>RUC</th>
                    <th>Distrito</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for emisor in emisores_data:
                <tr>
                    <td>{{emisor[0]}}</td>
                    <td>{{emisor[1]}}</td>
                    <td>{{emisor[2]}}</td>
                    <td>{{emisor[3]}}</td>
                    <td>{{emisor[4]}}</td>
                    <td>
                    <a href="/emisores/edit?id={{emisor[0]}}" class="btn">Editar</a>
                    <a href="/emisores/delete?id={{emisor[0]}}" class="btn">Eliminar</a>
                    </td> 
                </tr>
                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>
