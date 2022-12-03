import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

import 'package:tg/component/alt_larg.dart';

import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/model/super_classe.dart';
import 'package:tg/provider/Pedidos_provider.dart';

PedidosProvider pedidosProvider = PedidosProvider();

Widget corpoReordenado(BuildContext context, SuperProdutos objeto) {
  AltuLarg _tamanho = AltuLarg();

  return Card(
    color: Colors.amber.shade50,
    shadowColor: Colors.black,
    elevation: 3,
    child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Container(
                    // color: Colors.red,
                    width: _tamanho.larguraTela(context) * 0.23,
                    height: _tamanho.alturaTela(context) * 0.05,
                    child: Text("Nº Pedido: ${objeto.idPedidoCliente}", style: var_global.tamanhoPadraoTexto),
                  ),
                  Container(
                    // color: Colors.red,
                    width: _tamanho.larguraTela(context) * 0.23,
                    height: _tamanho.alturaTela(context) * 0.05,
                    child: Text("Produto: ${objeto.nomeProduto}", style: var_global.tamanhoPadraoTexto),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                // padding: const EdgeInsets.only(bottom: 5),
                height: _tamanho.alturaTela(context) * 0.09,
                child: TapDebouncer(
                  cooldown: const Duration(milliseconds: 500),
                  builder: (context, onTap) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: Colors.green.shade400,
                      ),
                      onPressed: () async {
                        // Passar o objeto interiro
                        await PedidosProvider().finalizarProduto(objeto);
                      },
                      child: Text('Finalizar', style: var_global.tamanhoPadraoTexto),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  // }
}
