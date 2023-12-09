<!DOCTYPE html>
<html>
<head>
% include('new.tpl')
</head>
<body>
  <h1>Crear Servicio</h1>
  <form action="/servicios/save" method="post">
    <input type="hidden" name="id" value="{{servicios_data[0]}}"><br>
    <table>
      <tr>
        <td>Descripcion:</td>
        <td><input type="text" id="id" name="descripcion" value="{{servicios_data[1]}}"></td>
      </tr>
        <tr>
        <td>Valor unitario:</td>
        <td><input type="text" id="valor_unitario" name="valor_unitario" value="{{servicios_data[2]}}"></td>
        </tr>
        <tr>
        <td>Unidad de medida:</td>
        <td>
        <select id="opcionSelect1" onchange="actualizarValor1()">
        <option value="">Seleccione una opcion</option>
        % for unidad in unidades_data:
            % if servicios_data[3] == unidad[0]:
            <option select value="{{unidad[0]}}">{{unidad[1]}}</option>
            %else:
            <option value ="{{unidad[0]}}">{{unidad[1]}}</option>
            %end
        %end
    </select>
    </td>
    <input type="hidden" id = "valorInput1" name="unidad_medida_id" value="{{servicios_data[3]}}">
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
  <a href="/servicios" class="btn">Cancelar</a><br><br>
</body>
</html>