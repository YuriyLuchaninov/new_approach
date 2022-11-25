import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/index.dart';

class StatusBuilder<T> extends StatelessWidget {
  const StatusBuilder({
    super.key,
    required this.initialData,
    required this.builder,
  });

  final Object initialData;
  final Widget Function(BuildContext context, Object? data) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: context.read<BLoI>().status<T>(),
      initialData: initialData,
      builder: (context, snapshot) => builder(context, snapshot.data),
    );
  }
}
