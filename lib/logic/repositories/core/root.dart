import 'dart:async';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'status.dart';
import 'channel.dart';

abstract class RootRepository<T, K> {
  RootRepository() {
    _subscription = CommandChannel.channel
        .where((action) => action is T)
        .listen((action) async {
      final data = await onAction(action as T);
      _core.add(data);
    });
  }

  final _core = BehaviorSubject<K?>();
  late final StreamSubscription _subscription;

  Stream<K?> get stream => _core.stream;

  @protected
  Future<K?> onAction(T action);

  @protected
  void updateData(K data) => _core.add(data);

  @protected
  void updateStatus<Q>(Object status) => Status.update<Q>(status);

  @protected
  K? get data => _core.value;

  @protected
  get send => CommandChannel.send;

  Future<dynamic> dispose() =>
      _subscription.cancel().then((_) => _core.close());
}
