import '../../index.dart';

abstract class TaskAction extends AppAction {}

class AddTask extends TaskAction {
  final String title;

  AddTask({required this.title});
}

class RemoveTask extends TaskAction {
  final Task task;

  RemoveTask(this.task);
}

class UpdateTask extends TaskAction {
  final Task task;

  UpdateTask(this.task);
}
