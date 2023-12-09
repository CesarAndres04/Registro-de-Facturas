<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tipos de Moneda</title>
    % include('tabla.tpl')
</head>

<body>
    <div class="content-container">
        <h1>Lista de Tipos de Moneda</h1>
        <a href="/monedas/new" class="btn">Agregar Moneda</a><br><br>
        <table id="monedasTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                % for moneda in monedas_data:
                <tr>
                    <td>{{moneda[0]}}</td>
                    <td>{{moneda[1]}}</td>
                    <td>
                    <a href="/monedas/edit?id={{moneda[0]}}" class="btn">Editar</a>
                    <a href="/monedas/delete?id={{moneda[0]}}" class="btn">Eliminar</a>
                    </td>  
                </tr>
                % end
            </tbody>
        </table>
        <button onclick="location.href='/';">Volver a la Página Principal</button>
    </div>
</body>

</html>
