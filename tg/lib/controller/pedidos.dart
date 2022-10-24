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
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

//Reordenar
  });
}