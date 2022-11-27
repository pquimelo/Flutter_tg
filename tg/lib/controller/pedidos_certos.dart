import 'package:tg/component/periodo.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tg/model/pedidos.dart';


reordenarPedidosCerto(){

var_global.tempoPegarPedido = periodo(const Duration(seconds: 10), (cycle) async {


  var url = Uri.https('menuon-api.herokuapp.com', '/orders');

    var response = await http.get(url);
    List<Pedidos> respostaApi = [];
    if (response.statusCode == 200) {
      List jsonResponse = convert.jsonDecode(response.body);
      print('JsonResponse ${jsonResponse}');
      for (var element in jsonResponse) { 
        for (var produtos in (element['Products'] as List)) { 
      var_global.pedidosFila.add(Pedidos(
          cpf: element['User']['cpf'],
          dataInsercao: element['insertion_date'],
          idPedido: element ['id_order'],
          produtos:  [
            Produtos(
          idProduto: produtos['id_product'],
          nomeProduto: produtos['name'],
          quantidadePedida: produtos['sales']['quantity_sold'],
          ),]
          
      ), );

      }
       
      }}
      print(' AAAAAAAAAAAAAAAAAAAAAAAAA ${var_global.pedidosFila}');
    
});
}