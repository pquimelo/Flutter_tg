import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tg/View/Pedidos/corpo_pedidos.dart';
import 'package:tg/View/lista_reordenada/lista_reordenada.dart';
import 'package:tg/component/alt_larg.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/controller/pedidos.dart';
import 'package:tg/controller/pedidos_certos.dart';
// import 'package:tg/controller/pedidos.dart';
import 'package:tg/provider/Pedidos_provider.dart';
import 'package:tg/provider/iniciar/controlar.dart';
import 'package:tg/provider/iniciar/iniciar.dart';
// import 'package:tg/provider/lista_pedido.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

AltuLarg _tamanho = AltuLarg();

class _HomeState extends State<Home> {
  @override
  void initState() {
    // PedidosProvider().reordenarPedidosCerto();

    super.initState();
  }

  Future _reordenarPedidos() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: context.watch<IniciarProvider>().inciouOperacao ? Colors.red : Colors.green,
            child: Icon(
              context.watch<IniciarProvider>().inciouOperacao ? Icons.pause : Icons.play_arrow_outlined,
              size: _tamanho.larguraTela(context) * 0.05,
            ),
            onPressed: () async {
              await controlarOperacao();
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: _tamanho.larguraTela(context),
              height: _tamanho.alturaTela(context) * 0.11,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        // color: Colors.blue,
                        width: _tamanho.larguraTela(context) * 0.49,
                        // height: _tamanho.alturaTela(context) * 0.05,
                        child: const Center(
                          child: Text(
                            'Pedidos para preparar ',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        // padding: const EdgeInsets.only(
                        //   top: 10,
                        // ),
                        // color: Colors.blue,
                        // width: _tamanho.larguraTela(context) * 0.40,
                        // height: _tamanho.alturaTela(context) * 0.05,
                        child: Center(
                          child: Text(
                            'Pedidos em preparação ',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 10, right: 5, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: const Color.fromARGB(255, 222, 54, 251),
                      ),
                    ),
                    width: _tamanho.larguraTela(context) * 0.4,
                    height: _tamanho.alturaTela(context) * 0.8,
                    child: ListView.builder(
                      itemCount: context.watch<PedidosProvider>().listaPedidosProvider.length,
                      itemBuilder: (context, index) {
                        return corpoPedidos(
                          context,
                          context.watch<PedidosProvider>().listaPedidosProvider[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Container(
                      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: const Color.fromARGB(255, 222, 54, 251),
                        ),
                      ),
                      width: _tamanho.larguraTela(context) * 0.4,
                      height: _tamanho.alturaTela(context) * 0.8,
                      child: ListView.builder(
                        itemCount: context.watch<PedidosProvider>().listaIndice2.length,
                        itemBuilder: (context, index) {
                          return corpoReordenado(context, context.watch<PedidosProvider>().listaIndice2[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
