% include('new.tpl')

<body>

  <h1>Crear Factura {{id}}</h1>
  <form action="/facturas/save" method="post">
    <input type="hidden" name="id" value="{{facturas_data[0]}}"><br>
    <table>
        <tr>
        <td>Codigo:</td>
        <td><input type="text" id = "numero"name="numero" value="{{facturas_data[1]}}"></td>
      </tr>
        <tr>
        <td>Observación:</td>
        <td><input type="text" id = "observacion" name="observacion" value="{{facturas_data[3]}}"></td>
      </tr>
        <tr>
        <td>Fecha:</td>
        <td><input type="date" id="fecha" name="fecha" value="{{facturas_data[4]}}"></td>
      </tr>
      <tr>
        <td>Moneda:</td>
        <td>
        <select id="opcionSelect1" onchange="actualizarValor1()">
          <option value="">Seleccione una opción</option>
          % for moneda in monedas_data:
            % if facturas_data[5] == moneda[0]:
              <option selected value="{{moneda[0]}}">{{moneda[1]}}</option>
            % else:
              <option value="{{moneda[0]}}">{{moneda[1]}}</option>
            % end
          % end
        </select>
        </td>
        <input type="hidden" id="valorInput1" name="tipo_moneda_id" value="{{facturas_data[5]}}"">
      </tr>

        <td>Emisor:</td>
        <td>
        <select id="opcionSelect2" onchange="actualizarValor2()">
        <option value="">Seleccione una opcion</option>
        % for emisor in emisores_data:
            % if facturas_data[6] == emisor[0]:
            <option select value="{{emisor[0]}}">{{emisor[1]}}</option>
            %else:
            <option value ="{{emisor[0]}}">{{emisor[1]}}</option>
            %end
        %end
    </select>
        </td>
        <input type="hidden" id="valorInput2" name="emisor_id" value="{{facturas_data[6]}}"">
    </tr>

        <td>Receptor:</td>
        <td>
        <select id="opcionSelect3" onchange="actualizarValor3()">
        <option value="">Seleccione una opcion</option>
        % for receptor in receptores_data:
            % if facturas_data[7] == receptor[0]:
            <option select value="{{receptor[0]}}">{{receptor[2]}}</option>
            %else:
            <option value ="{{receptor[0]}}">{{receptor[2]}}</option>
            %end
        %end
    </select>
        </td>
        <input type="hidden" id="valorInput3" name="receptor_id" value="{{facturas_data[7]}}"">
    </tr>

        <td>Medio de pago:</td>
        <td>
        <select id="opcionSelect4" onchange="actualizarValor4()">
        <option value="">Seleccione una opcion</option>
        % for pago in pagos_data:
            % if facturas_data[8] == pago[0]:
            <option select value="{{pago[0]}}">{{pago[1]}}</option>
            %else:
            <option value ="{{pago[0]}}">{{pago[1]}}</option>
            %end
        %end
    </select>
        </td>
        <input type="hidden" id="valorInput4" name="medio_pago_id" value="{{facturas_data[8]}}"">
    </tr>


      <tr>
        <td></td>
        <td>
          <button class="btn">Guardar Cambios</button>
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
      function actualizarValor2() {
        var selectElement = document.getElementById("opcionSelect2");
        var selectedValue = selectElement.value;
  
        var valorInput = document.getElementById("valorInput2");
        valorInput.value = selectedValue;
    }
          function actualizarValor3() {
        var selectElement = document.getElementById("opcionSelect3");
        var selectedValue = selectElement.value;
  
        var valorInput = document.getElementById("valorInput3");
        valorInput.value = selectedValue;
    }
          function actualizarValor4() {
        var selectElement = document.getElementById("opcionSelect4");
        var selectedValue = selectElement.value;
  
        var valorInput = document.getElementById("valorInput4");
        valorInput.value = selectedValue;
    }
         
    </script>
  </form>

  <a href="/facturas" class="btn">Cancelar</a>
</body>
</html>