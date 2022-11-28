import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../logic/index.dart';
import '../../index.dart';
import 'widgets/index.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = context.read<BLoI>();

    return Scaffold(
      body: SafeArea(
        child: Consumer<List<Task>>(
          builder: (_, data, __) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              final task = data[index];

              return Dismissible(
                key: Key(task.id),
                onDismissed: (_) => logic.send(RemoveTask(task)),
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (isDone) => logic.send(
                    UpdateTask(task.copyWith(
                      status: task.status == TaskStatus.done
                          ? TaskStatus.active
                          : TaskStatus.done,
                    )),
                  ),
                  value: task.status == TaskStatus.done,
                  title: Text(task.title),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: StatusBuilder<TaskRepository>(
        initialData: Free(),
        builder: (context, status) => FloatingActionButton(
          onPressed: status is InProgress ? null : () => addDialog(context),
          child: status is InProgress
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    const CircularProgressIndicator(color: Colors.white),
                    Center(child: Text('${status.progress}')),
                  ],
                )
              : const Icon(Icons.add),
        ),
      ),
    );
  }
}
