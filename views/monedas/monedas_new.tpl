<!DOCTYPE html>
<html>
<head>
% include('new.tpl')
</head>
<body>
  <h1>Crear Moneda</h1>
  <form action="/monedas/save" method="post">
    <input type="hidden" name="id" value="{{monedas_data[0]}}"><br>
    <table>
      <tr>
        <td>Nombre:</td>
        <td><input type="text" id="id" name="nombre" value="{{monedas_data[1]}}"></td>
      </tr>
      <tr>
        <td></td>
        <td>
          <button>Guardar Cambios</button>
        </td>
      </tr>
    </table>
  </form>

  <br>
  <a href="/monedas" class="btn">Cancelar</a><br><br>
</body>
</html>