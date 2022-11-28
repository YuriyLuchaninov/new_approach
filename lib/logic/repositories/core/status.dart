import 'dart:async';
import 'package:rxdart/rxdart.dart';

class Status {
  static final _statuses = <int, Object?>{};
  static final _core = BehaviorSubject<Map<int, Object?>>();

  static int _key(Object object) =>Object.hash(object, '');

  static void update<T>(Object status) {
    assert(T != dynamic, 'You need to setup Repository Class');
    _statuses[_key(T)] = status;
    _core.sink.add(_statuses);
  }

  static void clear() {
    _statuses.clear();
  }

  static Stream<Object> stream<T>() => _core.stream.transform(
      StreamTransformer<Map<int, Object?>, Object>.fromHandlers(
          handleData: (Map<int, Object?> data, EventSink sink) =>
              sink.add(data[_key(T)])));

  static Future<dynamic> dispose() => _core.close();
}
