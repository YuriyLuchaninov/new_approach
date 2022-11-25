import 'dart:async';
import 'package:rxdart/rxdart.dart';

class Status {
  static final _statuses = <int, Object?>{};
  static final _core = BehaviorSubject<Map<int, Object?>>();

  static void update<T>(Object status) {
    _statuses[Object.hash(T, '')] = status;
    _core.sink.add(_statuses);
  }

  static void clear<T>() {
    _statuses[Object.hash(T, '')] = null;
  }

  static Stream<Object> stream<T>() => _core.stream.transform(
      StreamTransformer<Map<int, Object?>, Object>.fromHandlers(
          handleData: (Map<int, Object?> data, EventSink sink) =>
              sink.add(data[Object.hash(T, '')])));

  static Future<dynamic> dispose() => _core.close();
}
