<!DOCTYPE html>
<html>
<head>
% include('new.tpl')
</head>
<body>
  <h1>Crear Unidad de medida</h1>
  <form action="/unidades/save" method="post">
    <input type="hidden" name="id" value="{{unidades_data[0]}}"><br>
    <table>
      <tr>
        <td>Nombre:</td>
        <td><input type="text" id="id" name="nombre" value="{{unidades_data[1]}}"></td>
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
  <a href="/unidades" class="btn">Cancelar</a><br><br>
</body>
</html>