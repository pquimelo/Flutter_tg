import 'package:flutter/material.dart';
import 'package:tg/model/pedidos.dart';
import'package:tg/component/var_global.dart' as var_global;
import 'package:tg/provider/Pedidos_provider.dart';
abriDialog(BuildContext context,Pedidos objeto) {
   Widget cancelaButton = ElevatedButton(
    
    style: ElevatedButton.styleFrom(primary: Colors.red),
    child: Text("Fechar"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continuaButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Colors.green),
    child: Text("Começar"),
    onPressed:  () {
       
        var_global.listaComIndiceCerto.add(objeto);
        PedidosProvider().criarCardsProdutos();
        Navigator.of(context).pop();
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Atenção!"),
    content: Text("Deseja começar a preparar esse pedido?"),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cancelaButton,
          continuaButton,
        ],
      ),
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}