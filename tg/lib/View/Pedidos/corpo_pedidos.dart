import 'package:flutter/material.dart';

import 'package:tg/component/alt_larg.dart';
import 'package:tg/model/pedidos.dart';
import 'package:tg/component/var_global.dart' as var_global;

corpoPedidos(BuildContext context, Pedidos objeto) {
  AltuLarg _tamanho = AltuLarg();
  return Column(children: [
    Container(
      width: _tamanho.larguraTela(context) * 0.95,
      // height: _tamanho.alturaTela(context) * 0.25,
      child: Card(
        color: Colors.grey,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  // color: Colors.red,
                  width: _tamanho.larguraTela(context) * 0.18,
                  // height: _tamanho.alturaTela(context) * 0.25,
                  child: Text(
                    'Nº pedido : ',
                    style: var_global.tamanhoPadraoTexto,
                  ),
                ),
                Container(
                  // color: Colors.red,
                  width: _tamanho.larguraTela(context) * 0.2,
                  // height: _tamanho.alturaTela(context) * 0.25,
                  child: Text(
                    objeto.idPedido.toString(),
                    style: var_global.tamanhoPadraoTexto,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Produtos :',
                    style: var_global.tamanhoPadraoTexto,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ]);
}
