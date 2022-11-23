import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:tg/component/alt_larg.dart';
import 'package:tg/component/dialog.dart';
import 'package:tg/model/pedidos.dart';
import 'package:tg/component/var_global.dart' as var_global;

List<Widget> corpoPedidos(BuildContext context, Pedidos objeto) {
  AltuLarg _tamanho = AltuLarg();
  List<Widget> a = [];

  
      for (var element in objeto.produtos!)
      {a.add(InkWell(
        onTap: (){
          abriDialog(context,objeto);
        },
        child: Card(
          // color: Color.fromARGB(0, 77, 77, 77),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      child: Text("Nº pedido: ${objeto.idPedido}"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      // color: Colors.red,
                      width: _tamanho.larguraTela(context) * 0.23,
                      height: _tamanho.alturaTela(context) * 0.05,
                      child: AutoSizeText("Produtos: ${element.quantidadePedida} X  ${element.nomeProduto}", style: var_global.tamanhoPadraoTexto),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ));}
   
  return a;
  
}
