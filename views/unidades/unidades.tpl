<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unidades de Medida</title>
% include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Unidades de Medida</h1>
        <a href="/unidades/new" class="btn">Agregar unidad de medida</a><br><br>
        <table id="unitMeasuresTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for unidad in unidades_data:
                <tr>
                    <td>{{unidad[0]}}</td>
                    <td>{{unidad[1]}}</td>
                    <td>
                    <a href="/unidades/edit?id={{unidad[0]}}" class="btn">Editar</a>
                    <a href="/unidades/delete?id={{unidad[0]}}" class="btn">Eliminar</a>
                    </td>   
                </tr>
                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>
