import 'package:flutter/material.dart';
import 'package:tg/component/alt_larg.dart';
import 'package:tg/component/var_global.dart' as var_global;

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
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          // color: Colors.red,
                          width: _tamanho.larguraTela(context) * 0.1,
                          height: _tamanho.alturaTela(context) * 0.08,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        // color: Colors.blue,
                        width: _tamanho.larguraTela(context) * 0.85,
                        // height: _tamanho.alturaTela(context) * 0.05,
                        child: Text(
                          'Lista justificar parada',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              // color: Colors.pink,
              width: _tamanho.larguraTela(context),
              height: _tamanho.alturaTela(context) * 0.84,
              child: ListView(
                  // children: List.generate(
                  //   context.watch<MotivoParadaProvider>().listaMotivoProvider.length,
                  //   (index) {
                  //     return corpoMotivoParada(context, context.watch<MotivoParadaProvider>().listaMotivoProvider[index]);
                  //   },
                  // ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
