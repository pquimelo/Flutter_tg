import 'package:tg/component/var_global.dart' as var_global;
import 'package:tg/provider/Pedidos_provider.dart';
import 'package:tg/provider/iniciar/iniciar.dart';

Future controlarOperacao() async {
  if (var_global.iniciouOperacao) {
    await pausarOperacao();
  } else {
    await iniciarOperacao();
  }
}
