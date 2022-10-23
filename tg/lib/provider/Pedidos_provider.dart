import 'package:flutter/material.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/model/pedidos.dart';

class PedidosProvider extends ChangeNotifier {
  static final PedidosProvider _instance = PedidosProvider.internal();
  factory PedidosProvider() => _instance;
  PedidosProvider.internal();

  List get listaPedidosProvider => var_global.pedidosFila;
  atualizarLista(Pedidos objeto) {
    notifyListeners();
  }
}
