import 'package:flutter/material.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/model/pedidos.dart';

class PedidosProvider extends ChangeNotifier {
  static final PedidosProvider _instance = PedidosProvider.internal();
  factory PedidosProvider() => _instance;
  PedidosProvider.internal();

  List get listaPedidosProvider => var_global.pedidosFila;
  List get listaComIndiceCerto => var_global.listaComIndiceCerto;
  List get listaProdutos =>var_global.listaProdutos;

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
          Produtos(idProduto: 2, nomeProduto: 'strognoff', quantidadePedida: 1),
          Produtos(idProduto: 2, nomeProduto: 'Batata', quantidadePedida: 3),
        ],
      ),
    ];

    notifyListeners();
  }

  criarCards() {
    for (var element in var_global.listaComIndiceCerto) {
      for (var produtos in element.produtos!) {
        for (int i = 0; i < produtos.quantidadePedida!; i++) {
          var_global.listaComIndiceCerto.add(
            Pedidos(
              cpf: element.cpf,
              idPedido: element.idPedido,
              produtos: [
                Produtos(
                  idProduto: produtos.idProduto,
                  nomeProduto: produtos.nomeProduto,
                  // quantidadePedida: produtos.quantidadePedida
                  tempoPreparo: produtos.tempoPreparo,
                  statusProdutos: 0,
                ),
              ],
            ),
          );
        }
      }
    }
    notifyListeners();
  }
  criarCardsProdutos() {
  for (var produtos in var_global.listaProdutos) {
        for (int i = 0; i < produtos.quantidadePedida!; i++) {
          var_global.listaComIndiceCerto.add(
            Pedidos(
              
              produtos: [
                Produtos(
                  idProduto: produtos.idProduto,
                  nomeProduto: produtos.nomeProduto,
                  // quantidadePedida: produtos.quantidadePedida
                  tempoPreparo: produtos.tempoPreparo,
                  statusProdutos: 0,
                ),
              ],
            ),
          );
        }
         notifyListeners();
    }
   
  }

  finalizarProduto(Pedidos objeto) {
    objeto.produtos![0].statusProdutos = 1;

    var_global.listaComIndiceCerto.remove(objeto);
    notifyListeners();
  }
}
