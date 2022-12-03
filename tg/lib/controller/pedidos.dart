import 'package:tg/component/periodo.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/model/pedidos.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

// reordenarPedidos() {
//   var_global.timerPedidos = periodo(const Duration(seconds: 10), (cycle) async {
//     //pegar via API
// // var url = Uri.https('menuon-api.herokuapp.com/', '/orders', {'q': '{http}'});
//     var url = Uri.https('menuon-api.herokuapp.com', '/orders');

//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var jsonResponse = convert.jsonDecode(response.body);
//       Pedidos dadosApi = Pedidos(
//         cpf: jsonResponse['user']['cpf'],
//         idPedido: int.parse(jsonResponse['id_order']),
//         produtos: [
//           //TODO: VEM ZERADO PARA MANIPULAR NO CLIQUE
//           Produtos(
//             statusProdutos: 0,
//           ),
//         ],
//       );
//       DateTime dataAtual = DateTime.now();
//       var_global.pedidosFila.add(dadosApi);

//       for (var element in var_global.pedidosFila) {
//         var convertido = DateTime.parse(element.dataInsercao!);
//         Duration diferenca = dataAtual.difference(convertido);

//         for (var prod in element.produtos!) {
//           int conversaoTempoPreparo = int.parse(prod.tempoPreparo!);

//           if (diferenca.inMinutes >= conversaoTempoPreparo && prod.statusProdutos == 1) {
//             print('Pedido Finalizado');
//           } else {}
//         }
//       }
//       print('Dados Api ${dadosApi.cpf}');
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }

// //Reordenar
//   });
// }
