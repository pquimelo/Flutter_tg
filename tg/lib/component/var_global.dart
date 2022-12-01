// ignore_for_file: prefer_const_constructors

library my_prj.var_global;

import 'dart:async';

import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:tg/model/pedidos.dart';
import 'package:tg/model/super_classe.dart';

Completer<bool>? tempoPegarPedido;
Completer<bool>? tempoReordenacao;
List<Pedidos> pedidosFila = [];
List<Produtos> listaProdutos = [];
TextStyle tamanhoPadraoTexto = TextStyle(
  fontSize: 15,
);
List<Pedidos> listaComIndiceCerto = [];
List<Widget> a = [];
List<SuperProdutos> listaIndice2 = [];

List<DragAndDropList> listAlterada = [];
bool primeiraVez = true;
bool iniciouOperacao = false;
