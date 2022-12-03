
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:tg/component/var_global.dart' as var_global;
class ListaAlterada extends ChangeNotifier {
  static final ListaAlterada _instance = ListaAlterada.internal();
  factory ListaAlterada() => _instance;
  ListaAlterada.internal();



onListReorder(int oldListIndex, int newListIndex) {
    
      var movedList =var_global.listAlterada.removeAt(oldListIndex);
      var_global.listAlterada.insert(newListIndex, movedList);
 
  }
}
