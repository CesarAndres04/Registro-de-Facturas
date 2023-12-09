<!DOCTYPE html>
<html>
<head>
% include('new.tpl')
</head>
<body>
  <h1>Crear Distrito</h1>
  <form action="/distritos/save" method="post">
    <input type="hidden" name="id" value="{{distritos_data[0]}}"><br>
    <table>
      <tr>
        <td>Nombre:</td>
        <td><input type="text" id="id" name="nombre" value="{{distritos_data[1]}}"></td>
      </tr>
        <tr>
        <td>Provincia:</td>
        <td>
        <select id="opcionSelect1" onchange="actualizarValor1()">
        <option value="">Seleccione una opcion</option>
        % for provincia in provincias_data:
            % if distritos_data[2] == provincia[0]:
            <option select value="{{provincia[0]}}">{{provincia[1]}}</option>
            %else:
            <option value ="{{provincia[0]}}">{{provincia[1]}}</option>
            %end
        %end
    </select>
    </td>
    <input type="hidden" id = "valorInput1" name="provincia_id" value="{{distritos_data[2]}}">
    </tr>
      </tr>
      <tr>
        <td></td>
        <td>
          <button>Guardar Cambios</button>
        </td>
      </tr>
    </table>

    <script>
      function actualizarValor1() {
        var selectElement = document.getElementById("opcionSelect1");
        var selectedValue = selectElement.value;
  
        var valorInput = document.getElementById("valorInput1");
        valorInput.value = selectedValue;
    }
    </script>

  </form>

  <br>
  <a href="/distritos" class="btn">Cancelar</a><br><br>
</body>
</html>