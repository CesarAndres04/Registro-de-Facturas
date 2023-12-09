<body>
% include('edit.tpl')
  <h1>Editar Provincia {{id}}</h1>

  <form action="/provincias/save" method="post">
    <input type="hidden" name="id" value="{{provincias_data[0]}}"><br>
   <table>
      <tr>
        <td>Nombre:</td>
        <td><input type="text" id="id" name="nombre" value="{{provincias_data[1]}}"></td>
      </tr>
        <tr>
        <td>Departamento:</td>
        <td>
        <select id="opcionSelect1" onchange="actualizarValor1()">
        <option value="">Seleccione una opcion</option>
        % for departamento in departamentos_data:
            % if provincias_data[2] == departamento[0]:
            <option select value="{{departamento[0]}}">{{departamento[1]}}</option>
            %else:
            <option value ="{{departamento[0]}}">{{departamento[1]}}</option>
            %end
        %end
    </select>
    </td>
    <input type="hidden" id = "valorInput1" name="departamento_id" value="{{provincias_data[2]}}">
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
  <a href="/provincias" class="btn">Cancelar</a><br><br>
</body>
</html>