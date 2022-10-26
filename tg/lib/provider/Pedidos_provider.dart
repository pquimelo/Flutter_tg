import 'package:flutter/material.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/model/pedidos.dart';

class PedidosProvider extends ChangeNotifier {
  static final PedidosProvider _instance = PedidosProvider.internal();
  factory PedidosProvider() => _instance;
  PedidosProvider.internal();

  List get listaPedidosProvider => var_global.pedidosFila;

  reordenarPedido() {
    // listaPedidosProvider;
    var_global.pedidosFila = [
      Pedidos(
        cpf: '44452014745',
        idPedido: 5,
        produtos: [
          Produtos(idProduto: 2, nomeProduto: 'Lasanha', quantidadePedida: 15),
          Produtos(idProduto: 2, nomeProduto: 'Batata', quantidadePedida: 2),
        ],
      ),
      Pedidos(
        cpf: '44452014745',
        idPedido: 2,
        produtos: [
          Produtos(idProduto: 2, nomeProduto: 'Lasanha', quantidadePedida: 1),
          Produtos(idProduto: 2, nomeProduto: 'Batata', quantidadePedida: 3),
        ],
      ),
    ];

    notifyListeners();
  }

  finalizarProduto(Pedidos objeto) {
    var index = var_global.pedidosFila.indexOf(objeto);
    for (var finalizar in objeto.produtos!) {
      finalizar.statusProdutos = 1;
    }
    var_global.pedidosFila.removeAt(index);
    notifyListeners();
  }
}
