<!DOCTYPE html>
<html>
<head>
% include('new.tpl')
</head>
<body>
  <h1>Crear Metodo de pago</h1>
  <form action="/pagos/save" method="post">
    <input type="hidden" name="id" value="{{pagos_data[0]}}"><br>
    <table>
      <tr>
        <td>Nombre:</td>
        <td><input type="text" id="id" name="nombre" value="{{pagos_data[1]}}"></td>
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
  <a href="/pagos" class="btn">Cancelar</a><br><br>
</body>
</html>