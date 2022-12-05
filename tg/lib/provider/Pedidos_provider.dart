import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
    bool passouAqui = false;
    var url = Uri.https('menuon-api.herokuapp.com', '/orders');
    var_global.tempoPegarPedido = periodo(const Duration(minutes: 1), (cycle) async {
      var response = await http.get(url);

      List jsonResponse = convert.jsonDecode(response.body);
      if (passouAqui == false) {
        if (response.statusCode == 200) {
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
            notifyListeners();
          }
          notifyListeners();
          var_global.primeiraVez == false;
        } else {
          final snackBar = SnackBar(
            /// need to set following properties for best effect of awesome_snackbar_content
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error!',
              message: 'Problemas com a internet!',

              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              contentType: ContentType.failure,
            ),
          );
        }
        passouAqui = true;
      } else {
        for (var json in jsonResponse) {
          //TODO: GAMBIARRA VER COM OS MENINOS
          for (var element in var_global.pedidosFila) {
            if (!var_global.pedidosFila.contains(element)) {
              Pedidos pedido = Pedidos(
                produtos: [],
              );

              pedido.statusPedido = json['status'];
              pedido.cpf = json['User']['cpf'];
              pedido.dataInsercao = json['insertion_date'];
              pedido.idPedido = json['id_order'];
              for (var produtos in (json['Products'] as List)) {
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
              notifyListeners();
            } else {
              //se for igualq
              print('Funcionou');
            }
          }
        }
      }
    });
    var_global.pedidosFila;
    notifyListeners();
  }

  reordenar() {
    int index;

    var_global.tempoReordenacao = periodo(const Duration(seconds: 30), (cycle) async {
      if (var_global.listaIndice2.isNotEmpty) {
        for (var element in var_global.listaIndice2) {
          switch (element.prioridade) {
            case 0:
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
