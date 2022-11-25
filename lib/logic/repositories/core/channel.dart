import 'package:rxdart/rxdart.dart';
import 'actions.dart';

class CommandChannel {
  static final _core = PublishSubject<AppAction>();

  static void send(AppAction action) => _core.sink.add(action);

  static Stream<AppAction> get channel => _core.stream;

  static Future<dynamic> dispose() => _core.close();
}
