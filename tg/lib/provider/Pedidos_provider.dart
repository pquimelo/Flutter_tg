import 'package:flutter/material.dart';
import 'package:tg/component/periodo.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/model/pedidos.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

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

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = convert.jsonDecode(response.body);

      if (var_global.primeiraVez == true) {
        for (var element in jsonResponse) {
          for (var produtos in (element['Products'] as List)) {
            var_global.listaIndice2.add(
              Pedidos(
                statusPedido: element['status'],
                cpf: element['User']['cpf'],
                dataInsercao: element['insertion_date'],
                idPedido: element['id_order'],
                produtos: [
                  Produtos(
                    idProduto: produtos['id_product'],
                    tempoPreparo: produtos['preparation_time'],
                    nomeProduto: produtos['name'],
                    prioridade: produtos['priority'],
                    quantidadePedida: produtos['sales']['quantity_sold'],
                  )
                ],
              ),
            );
          }
        }
        var_global.primeiraVez == false;
      } else {
        for (var lista in var_global.listaIndice2) {
          for (var element in jsonResponse) {
            for (var produtos in (element['Products'] as List)) {
              if (lista.idPedido != element['id_order']) {
                var_global.listaIndice2.add(
                  Pedidos(
                    statusPedido: element['status'],
                    cpf: element['User']['cpf'],
                    dataInsercao: element['insertion_date'],
                    idPedido: element['id_order'],
                    produtos: [
                      Produtos(
                        idProduto: produtos['id_product'],
                        tempoPreparo: produtos['preparation_time'],
                        nomeProduto: produtos['name'],
                        prioridade: produtos['priority'],
                        quantidadePedida: produtos['sales']['quantity_sold'],
                      )
                    ],
                  ),
                );
              } else {
                print('ja existe');
              }
            }
          }
        }
      }
    }

    notifyListeners();
  }

  reordenar() {
    int index;
    //TODO: ADICIONAR O PERIODO
    var_global.tempoReordenacao = periodo(const Duration(seconds: 20), (cycle) async {
      DateTime dataAtual = DateTime.now();
      if (var_global.listaIndice2.isNotEmpty) {
        for (var element in var_global.listaIndice2) {
          for (var produtos in element.produtos!) {
            switch (produtos.prioridade) {
              case 0:
                // index = var_global.listaIndice2.indexOf(element);
                if (element.produtos![0].prioridade == 0) {
                } else {
                  index = 0;
                  var_global.listaIndice2.remove(element);
                  var_global.listaIndice2.insert(index, element);
                }

                //  TODO: ARRUMAR A DATA
                // DateTime dataFormatada = DateTime.parse(element.dataInsercao!);
                // Duration diferenca = dataFormatada.difference(dataAtual);
                // int tempoPreparoInt = int.parse(produtos.tempoPreparo!);
                // if (diferenca.inMinutes >= tempoPreparoInt) {
                // var_global.listaIndice2.remove(element);
                // }

                notifyListeners();
                break;
              case 1:
                // index = var_global.listaIndice2.indexOf(element);
                index = 1;
                var_global.listaIndice2.remove(element);
                var_global.listaIndice2.insert(index, element);
                notifyListeners();
                break;
              case 2:
                // index = var_global.listaIndice2.indexOf(element);
                index = 2;
                var_global.listaIndice2.remove(element);
                var_global.listaIndice2.insert(index, element);
                notifyListeners();
                break;
              default:
            }
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
    var_global.listaIndice2 = [];
    for (var element in var_global.listaComIndiceCerto) {
      for (var produtos in element.produtos!) {
        for (int i = 0; i < produtos.quantidadePedida!; i++) {
          var_global.listaIndice2.add(
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
      }
    }
    notifyListeners();
  }

  finalizarProduto(Pedidos objeto) {
    // objeto.produtos![0].statusProdutos = 1;

    var_global.listaIndice2.remove(objeto);
    notifyListeners();
  }

  atualizar() {
    notifyListeners();
  }
}
