% include('new.tpl')

<body>

  <h1>Crear un Detalle {{id}}</h1>
  <form action="/detalles/save" method="post">
    <input type="hidden" name="id" value="{{detalles_data[0]}}"><br>
    <table>
      <tr>
        <td>ID de Factura:</td>
        <td>
          <select name="factura_id" id="factura_id"
          % if factura_id!=0 :
          disabled
          % end
            <option value="">Seleccione una opción</option>
            % for factura in facturas_data:
              % if factura[0] == factura_id:
                <option selected value="{{factura[0]}}">{{factura[0]}}</option>
              % else:
                <option value="{{factura[0]}}">{{factura[0]}}</option>
              % end
            % end
        </select>
        </td>
      </tr>
      <tr>
        <td>Cantidad:</td>
        <td><input type="number" id="cantidad" name="cantidad" value="{{detalles_data[1]}}"></td>
      </tr>
      <tr>
        <td>Servicio:</td>
        <td>
        <select id="servicio_id" name="servicio_id" onChange="actualizarValorUnitario();actualizarValorTotal();">
          <option value="">Seleccione una opción</option>
          % for servicio in servicios_data:
            <option value="{{servicio[0]}}" class="{{servicio[1]}}" data-precio="{{servicio[2]}}">{{servicio[1]}}</option>
          % end
        </select>
        </td>
      </tr>
      <tr>
        <td>Valor unitario:</td>
        <td><input type="number" id="valor_unitario" name="valor_unitario" step=0.01></td>
      </tr>
      <tr>
        <td>Total:</td>
        <td><input type="numer" id="total" name="total" step=0.01 value="{{detalles_data[2]}}"></td>
      <tr>
        <td></td>
        <td>
          <button class="btn">Guardar Cambios</button>
        </td>
      </tr>
    </table>

    <script>

      function actualizarValorUnitario() {
        var e = document.getElementById('servicio_id');
        var costo_unitario = e.options[e.selectedIndex].getAttribute('data-precio');
        document.getElementById('valor_unitario').value = costo_unitario;
      }

      function actualizarValorTotal()
      {
        var str_cantidad = document.getElementById('cantidad').value
        var str_valor_unitario = document.getElementById('valor_unitario').value
        var cantidad = parseFloat(str_cantidad)
        var valor_unitario = parseFloat(str_valor_unitario)
        document.getElementById('total').value = parseFloat((cantidad * valor_unitario).toFixed(2))
      }

      document.querySelector("form").addEventListener("submit", function(e){
              document.getElementById('factura_id').removeAttribute("disabled");
          });

    </script>
  </form>

  <a href="/facturas" class="btn">Cancelar</a>
</body>
</html>