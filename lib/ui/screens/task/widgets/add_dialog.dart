import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../logic/index.dart';

void addDialog(BuildContext context) {
  final logic = context.read<BLoI>();
  String title = 'New Task';

  // show the dialog
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('New Task'),
      content: TextFormField(
        initialValue: title,
        onChanged: (value) => title = value,
        maxLength: 32,
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            logic.send(AddTask(title: title));
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}