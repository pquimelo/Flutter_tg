import 'package:tg/component/periodo.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/model/pedidos.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

reordenarPedidos() {
  var_global.timerPedidos = periodo(const Duration(seconds: 10), (cycle) async {
    //pegar via API
// var url = Uri.https('menuon-api.herokuapp.com/', '/orders', {'q': '{http}'});
    var url = Uri.https('menuon-api.herokuapp.com', '/orders');
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      Pedidos dadosApi = Pedidos(
        cpf: jsonResponse['user']['cpf'],
        idPedido: jsonResponse['id_order'],
      );
      print('Dados Api ${dadosApi.cpf}');

      // print(' aaaaaaa:  ${jsonResponse}');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

//Reordenar
  });
}
