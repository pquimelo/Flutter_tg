import 'package:intl/intl.dart';

String converterDecimalToData(int? epoch) {
  if (epoch != null) {
    // String? time;
    var time = DateTime.fromMillisecondsSinceEpoch(epoch * 1000, isUtc: true);
    //Criando o pattern de fomateação de data
    var modeloFomatado = DateFormat('dd/MM/yyyy hh:mm:ss');
    var fomatado = modeloFomatado.format(time);
    return fomatado.toString();
  }
  return '---';
}

String? converterDatas(DateTime data) {
  var modeloFomatado = DateFormat('dd/MM/yyyy');
  var fomatado = modeloFomatado.format(data);
  return fomatado.toString();
}

String? converterDataPrintTela(DateTime data) {
  var modeloFomatado = DateFormat('HH:mm:ss');
  var fomatado = modeloFomatado.format(data);
  return fomatado.toString();
}

String converterEpochDateTime(int data) {
  var time = DateTime.fromMillisecondsSinceEpoch(data * 100, isUtc: true);
  var modeloFomatado = DateFormat('yyyy-MM-dd hh:mm:ss');
  var fomatado = modeloFomatado.format(time);
  return fomatado.toString();
}
