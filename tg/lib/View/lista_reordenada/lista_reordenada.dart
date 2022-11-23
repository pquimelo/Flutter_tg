import 'package:flutter/material.dart';

import 'package:tg/component/alt_larg.dart';
import 'package:tg/model/pedidos.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/provider/pedidos_provider.dart';

List<Widget> corpoReordenado(BuildContext context, Pedidos objeto) {
  AltuLarg _tamanho = AltuLarg();
  List<Widget> a = [];

  for (var element in objeto.produtos!) {
    // for (int i = 0; i < element.quantidadePedida!; i++) {
    a.add(Card(
      // color: Color.fromARGB(0, 77, 77, 77),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 10),
          //       child: Container(
          //         child: Text("Nº pedido: ${objeto.idPedido}"),
          //       ),
          //     ),
          //   ],
          // ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  // color: Colors.red,
                  width: _tamanho.larguraTela(context) * 0.23,
                  height: _tamanho.alturaTela(context) * 0.05,
                  child: Text("Produto: ${element.nomeProduto}", style: var_global.tamanhoPadraoTexto),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                height: _tamanho.alturaTela(context) * 0.09,
                child: ElevatedButton(
                  onPressed: () async {
                    // Passar o objeto interiro
                    await PedidosProvider().finalizarProduto(objeto);
                  },
                  child: Text('Finalizar', style: var_global.tamanhoPadraoTexto),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
    // }
  }
  return a;
  // return Column(children: [
  //   Container(
  //     width: _tamanho.larguraTela(context) * 0.95,
  //     // height: _tamanho.alturaTela(context) * 0.25,
  //     child: Card(
  //       color: Colors.grey,
  //       child: Column(
  //         children: [
  //           Row(
  //             children: [
  //               Container(
  //                 padding: const EdgeInsets.only(left: 10),
  //                 // color: Colors.red,
  //                 width: _tamanho.larguraTela(context) * 0.18,
  //                 // height: _tamanho.alturaTela(context) * 0.25,
  //                 child: Text(
  //                   'Nº pedido : ',
  //                   style: var_global.tamanhoPadraoTexto,
  //                 ),
  //               ),
  //               Container(
  //                 // color: Colors.red,
  //                 width: _tamanho.larguraTela(context) * 0.2,
  //                 // height: _tamanho.alturaTela(context) * 0.25,
  //                 child: Text(
  //                   objeto.idPedido.toString(),
  //                   style: var_global.tamanhoPadraoTexto,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             children: [
  //               Container(
  //                 padding: const EdgeInsets.only(left: 10),
  //                 child: Text(
  //                   'Produtos :',
  //                   style: var_global.tamanhoPadraoTexto,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  // ]);
}
