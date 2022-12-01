import 'package:flutter/material.dart';
import 'package:tg/component/periodo.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/model/pedidos.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tg/model/super_classe.dart';

class PedidosProvider extends ChangeNotifier {
  static final PedidosProvider _instance = PedidosProvider.internal();
  factory PedidosProvider() => _instance;
  PedidosProvider.internal();

  List get listaPedidosProvider => var_global.pedidosFila;
  List get listaComIndiceCerto => var_global.listaComIndiceCerto;
  List get listaProdutos => var_global.listaProdutos;
  List get a => var_global.a;
  List get listaIndice2 => var_global.listaIndice2;

  pegarPedidos() async {
    var url = Uri.https('menuon-api.herokuapp.com', '/orders');
    var_global.tempoPegarPedido = periodo(const Duration(minutes: 1), (cycle) async {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List jsonResponse = convert.jsonDecode(response.body);
        //TODO: O PROBLEMA ESTA SENDO COMO ADICIONAR NA LISTA 1 PEDIDO VARIOS PRODUTOS
        if (var_global.primeiraVez == true) {
          for (var element in jsonResponse) {
            Pedidos pedido = Pedidos(
              produtos: [],
            );

            pedido.statusPedido = element['status'];
            pedido.cpf = element['User']['cpf'];
            pedido.dataInsercao = element['insertion_date'];
            pedido.idPedido = element['id_order'];
            for (var produtos in (element['Products'] as List)) {
              pedido.produtos?.add(
                Produtos(
                  idProduto: produtos['id_product'],
                  tempoPreparo: produtos['preparation_time'],
                  nomeProduto: produtos['name'],
                  prioridade: produtos['priority'],
                  quantidadePedida: produtos['sales']['quantity_sold'],
                ),
              );
            }
            var_global.pedidosFila.add(pedido);
          }

          var_global.primeiraVez == false;
        } else {
          //TODO: FAZER PASSAR AQUI UMA VEZ SO
        }
      }
    });

    notifyListeners();
  }

  reordenar() {
    int index;
    //TODO: ADICIONAR O PERIODO
    var_global.tempoReordenacao = periodo(const Duration(seconds: 30), (cycle) async {
      if (var_global.listaIndice2.isNotEmpty) {
        for (var element in var_global.listaIndice2) {
          switch (element.prioridade) {
            case 0:
              // index = var_global.listaIndice2.indexOf(element);
              if (var_global.listaIndice2[0].prioridade != 0) {
                index = 0;
                var_global.listaIndice2.remove(element);
                var_global.listaIndice2.insert(index, element);
              } else {}
              notifyListeners();
              break;
            case 1:
              if (var_global.listaIndice2[0].prioridade != 0 || var_global.listaIndice2[0].prioridade == 1) {
                index = 0;
                var_global.listaIndice2.remove(element);
                var_global.listaIndice2.insert(index, element);
              } else {}
              notifyListeners();
              break;
            case 2:
              if (var_global.listaIndice2[0].prioridade != 0 || var_global.listaIndice2[0].prioridade != 1 || var_global.listaIndice2[0].prioridade == 2) {
                index = 0;
                var_global.listaIndice2.remove(element);
                var_global.listaIndice2.insert(index, element);
              } else {}
              notifyListeners();
              break;
            default:
          }
        }
      }
    });
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
    // for (var element in var_global.listaIndice2) {

    //     for (int i = 0; i < element.quantidadePedidaProduto!; i++) {
    //       var_global.listaIndice2.add(
    //         Pedidos(
    //           produtos: [
    //             Produtos(
    //               idProduto: produtos.idProduto,
    //               nomeProduto: produtos.nomeProduto,
    //               // quantidadePedida: produtos.quantidadePedida
    //               tempoPreparo: produtos.tempoPreparo,
    //               statusProdutos: 0,
    //             ),
    //           ],
    //         ),
    //       );
    //     }

    // }
    notifyListeners();
  }

  finalizarProduto(SuperProdutos objeto) {
    // objeto.produtos![0].statusProdutos = 1;

    var_global.listaIndice2.remove(objeto);
    notifyListeners();
  }

  atualizar() {
    notifyListeners();
  }
}
