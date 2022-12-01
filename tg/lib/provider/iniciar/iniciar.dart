import 'package:flutter/material.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/provider/Pedidos_provider.dart';

class IniciarProvider extends ChangeNotifier {
  static final IniciarProvider _instance = IniciarProvider.internal();
  factory IniciarProvider() => _instance;
  IniciarProvider.internal();

  bool get inciouOperacao => var_global.iniciouOperacao;

  controlarOperacao() async {}

  iniciarOperacao() async {
    await PedidosProvider().pegarPedidos();
    await PedidosProvider().reordenar();
    notifyListeners();
  }

  pausarOperacao() {
    notifyListeners();
  }
}
