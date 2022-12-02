import 'package:flutter/material.dart';
import 'package:tg/View/lista_reordenada/lista_reordenada.dart';
import 'package:tg/model/pedidos.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/model/super_classe.dart';
import 'package:tg/provider/Pedidos_provider.dart';

abriDialog(BuildContext context, Pedidos objeto) {
  Widget cancelaButton = ElevatedButton(
    style: ElevatedButton.styleFrom(primary: Colors.red),
    child: Text("Fechar"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continuaButton = ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
    child: const Text("Começar"),
    onPressed: () {
      var_global.pedidosFila.remove(objeto);
      for (var element in objeto.produtos!) {
        for (int i = 0; i < element.quantidadePedida!; i++) {
          var_global.listaIndice2.add(
            SuperProdutos(
              cpfCliente: objeto.cpf,
              dataInsercaoPedido: objeto.dataInsercao,
              idPedidoCliente: objeto.idPedido,
              idProduto: element.idProduto,
              nomeProduto: element.nomeProduto,
              prioridade: element.prioridade,
              quantidadePedidaProduto: element.quantidadePedida,
              nomeDoCliente: objeto.nomeCliente,
            ),
          );
        }
      }
      PedidosProvider().atualizar();
      // PedidosProvider().criarCardsProdutos(objeto);
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
