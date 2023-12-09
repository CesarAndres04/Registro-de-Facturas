<!DOCTYPE html>
<html>
<head>
% include('new.tpl')
</head>
<body>
  <h1>Crear Departamentos</h1>
  <form action="/departamentos/save" method="post">
    <input type="hidden" name="id" value="{{departamentos_data[0]}}"><br>
    <table>
      <tr>
        <td>Nombre:</td>
        <td><input type="text" id="id" name="nombre" value="{{departamentos_data[1]}}"></td>
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
  <a href="/departamentos" class="btn">Cancelar</a><br><br>
</body>
</html>
