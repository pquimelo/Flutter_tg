import 'package:flutter/material.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/provider/Pedidos_provider.dart';

class IniciarProvider extends ChangeNotifier {
  static final IniciarProvider _instance = IniciarProvider.internal();
  factory IniciarProvider() => _instance;
  IniciarProvider.internal();

  bool get inciouOperacao => var_global.iniciouOperacao;
}

Future pausarOperacao() async {
  var_global.tempoPegarPedido!.complete(true);
  var_global.tempoReordenacao!.complete(true);
  await PedidosProvider().atualizar();
  var_global.iniciouOperacao = false;
}

Future iniciarOperacao() async {
  await PedidosProvider().pegarPedidos();
  await PedidosProvider().reordenar();
  await PedidosProvider().atualizar(); //TODO: AQUI NAO ESTA ATUALIZANDO O NOTIFI LISTENER
  var_global.iniciouOperacao = true;
}
