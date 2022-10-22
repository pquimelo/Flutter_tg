import 'package:flutter/material.dart';

class AltuLarg {
  // criando o padrao singleton
  static final AltuLarg _instance = AltuLarg.internal();
  factory AltuLarg() => _instance;
  AltuLarg.internal();

  double alturaTela(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double larguraTela(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
