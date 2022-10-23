import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tg/View/Pedidos/corpo_pedidos.dart';
import 'package:tg/component/alt_larg.dart';
import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/controller/pedidos.dart';
import 'package:tg/provider/lista_pedido.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

/*TODO : ADD O PROVIDER E COLOCAR A LISTA DE PEDIDO LA, PARA EXIBIR NA TELA List.generate(context.watch<MotivoParadaProvider>().listaMotivoProvider.length, (index) {
                  return corpoMotivoParada(context, context.watch<MotivoParadaProvider>().listaMotivoProvider[index]);
*/
AltuLarg _tamanho = AltuLarg();

class _HomeState extends State<Home> {
  @override
  void initState() {
    reordenarPedido();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        color: Colors.blue,
                        width: _tamanho.larguraTela(context) * 0.85,
                        // height: _tamanho.alturaTela(context) * 0.05,
                        child: const Text(
                          'Pedidos para preparar',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              width: _tamanho.larguraTela(context) * 0.99,
              height: _tamanho.alturaTela(context) * 0.8,
              child: ListView(
                children: List.generate(
                  context.watch<PedidosProvider>().listaPedidosProvider.length,
                  (index) {
                    return corpoPedidos(context, context.watch<PedidosProvider>().listaPedidosProvider[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
