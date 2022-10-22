import 'dart:async';

Completer<bool> periodo(Duration interval, Function(int cycle) callback) {
  final done = Completer<bool>();
  () async {
    var cycle = 0;
    while (!done.isCompleted) {
      try {
        await callback(cycle);
      } catch (e, s) {
        print("Erro: $e \nstackTrace: $s");
      }
      cycle++;
      await done.future.timeout(interval).onError((error, stackTrace) => false);
    }
  }();
  return done;
}

