import 'actions.dart';
import 'channel.dart';
import 'status.dart';

// Business Logic Interface
class BLoI {
  BLoI() {
    Status.clear();
  }

  Function(AppAction action) get send => CommandChannel.send;

  Stream<Object> status<T>() => Status.stream<T>();

  Future<dynamic> dispose() =>
      CommandChannel.dispose().then((_) => Status.dispose());
}
