<body>
% include('edit.tpl')
  <h1>Editar Receptor {{id}}</h1>

  <form action="/receptores/save" method="post">
    <input type="hidden" name="id" value="{{receptores_data[0]}}"><br>
    <table>
      <tr>
        <td>Nombre:</td>
        <td><input type="text" id="id" name="nombre" value="{{receptores_data[2]}}"></td>
      </tr>
        <tr>
        <td>RUC:</td>
        <td><input type="text" id="ruc" name="ruc" value="{{receptores_data[1]}}"></td>
        </tr>
        <tr>
        <td>Distrito:</td>
        <td>
        <select id="opcionSelect1" onchange="actualizarValor1()">
        <option value="">Seleccione una opcion</option>
        % for distrito in distritos_data:
            % if receptores_data[3] == distrito[0]:
            <option select value="{{distrito[0]}}">{{distrito[1]}}</option>
            %else:
            <option value ="{{distrito[0]}}">{{distrito[1]}}</option>
            %end
        %end
    </select>
    </td>
    <input type="hidden" id = "valorInput1" name="distrito_id" value="{{receptores_data[3]}}">
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
  <a href="/receptores" class="btn">Cancelar</a><br><br>
</body>
</html>