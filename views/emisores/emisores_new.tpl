<!DOCTYPE html>
<html>
<head>
% include('new.tpl')
</head>
<body>
  <h1>Crear Emisor</h1>
  <form action="/emisores/save" method="post">
    <input type="hidden" name="id" value="{{emisores_data[0]}}"><br>
    <table>
      <tr>
        <td>Nombre:</td>
        <td><input type="text" id="id" name="nombre" value="{{emisores_data[1]}}"></td>
      </tr>
        <tr>
        <td>Fecha de emisión:</td>
        <td><input type="date" id="fecha_emision" name="fecha_de_emision" value="{{emisores_data[2]}}"></td>
        </tr>
        <tr>
        <td>RUC:</td>
        <td><input type="text" id="ruc" name="ruc" value="{{emisores_data[3]}}"></td>
        </tr>
        <tr>
        <td>Distrito:</td>
        <td>
        <select id="opcionSelect1" onchange="actualizarValor1()">
        <option value="">Seleccione una opcion</option>
        % for distrito in distritos_data:
            % if emisores_data[4] == distrito[0]:
            <option select value="{{distrito[0]}}">{{distrito[1]}}</option>
            %else:
            <option value ="{{distrito[0]}}">{{distrito[1]}}</option>
            %end
        %end
    </select>
    </td>
    <input type="hidden" id = "valorInput1" name="distrito_id" value="{{emisores_data[4]}}">
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
  <a href="/emisores" class="btn">Cancelar</a><br><br>
</body>
</html>