// ignore_for_file: prefer_const_constructors

library my_prj.var_global;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:tg/model/pedidos.dart';

Completer<bool>? timerPedidos;
List<Pedidos> pedidosFila = [];
List<Produtos> listaProdutos = [];
TextStyle tamanhoPadraoTexto = TextStyle(
  fontSize: 15,
);
List<Pedidos> listaComIndiceCerto = [];
