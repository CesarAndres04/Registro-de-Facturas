<!DOCTYPE html>
<html>
<head>
% include('new.tpl')
</head>
<body>
  <h1>Crear Tributos</h1>
  <form action="/tributos/save" method="post">
    <input type="hidden" name="id" value="{{tributos_data[0]}}"><br>
    <table>
      <tr>
        <td>ID de Factura:</td>
        <td>
          <select name="factura_id" id="factura_id" onchange = "actualizarVenta();">
          % if factura_id!=0 :
          disabled
          % end
            <option value="">Seleccione una opción</option>
            % for factura in facturas_data:
              % if factura[0] == factura_id:
                <option selected value="{{factura[0]}}" data-venta="{{factura[2]}}">{{factura[1]}} - {{factura[2]}}</option>
              % else:
                <option value="{{factura[0]}}" data-venta="{{factura[2]}}">{{factura[0]}}</option>
              % end
            % end
        </select>
        </td>
      </tr>
      <tr>
        <td>Valor de venta:</td>
        <td><input type="text" id="valor_de_venta" name="valor_de_venta"></td>
      </tr>
        <tr>
        <td>Otros Tributos:</td>
        <td><input type="text" id="otros_tributos" name="otros_tributos" value="{{tributos_data[3]}}"></td>
      </tr>
        <tr>
        <td>ISC:</td>
        <td><input type="text" id="isc" name="isc" value="{{tributos_data[4]}}"></td>
      </tr>
        <tr>
        <td>ICBPER:</td>
        <td><input type="text" id="isc" name="icbper" value="{{tributos_data[5]}}"></td>
      </tr>
      <tr>
        <td></td>
        <td>
          <button>Guardar Cambios</button>
        </td>
      </tr>
    </table>

<script>
  function actualizarVenta() {
    var e = document.getElementById('factura_id');
    var venta = e.options[e.selectedIndex].getAttribute('data-venta');
    document.getElementById('valor_de_venta').value = venta;
  }
</script>
  </form>

  <br>
  <a href="/tributos" class="btn">Cancelar</a><br><br>
</body>
</html>