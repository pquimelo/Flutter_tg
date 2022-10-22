import 'package:tg/component/periodo.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/model/pedidos.dart';

reordenarPedido() {
  var_global.pedidos = [
    Pedidos(
      cpf: '44452014745',
      produtos: [
        Produtos(idProduto: 2, nomeProduto: 'Lasanha', quantidadePedida: 15),
        Produtos(idProduto: 2, nomeProduto: 'Batata', quantidadePedida: 2),
      ],
    ),
  ];

  var_global.timerPedidos = periodo(const Duration(seconds: 10), (cycle) {
    // for (var element in var_global.pedidos) {}
  });
}
