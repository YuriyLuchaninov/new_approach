import '../../index.dart';

export 'status.dart';
export 'action.dart';

class TaskRepository extends RootRepository<TaskAction, List<Task>> {
  final _tasks = <String, Task>{};

  List<Task> get _values => _tasks.values.toList();

  @override
  Future<List<Task>> onEvent(action) async {
    switch (action.runtimeType) {
      case AddTask:
        return _add(action as AddTask);
      case UpdateTask:
        final task = (action as UpdateTask).task;
        _tasks[task.id] = task;
        return _values;
      case RemoveTask:
        final task = (action as RemoveTask).task;
        _tasks.remove(task.id);
        Notification.showAction(
          'Task was deleted! Tap to UnDo.',
          () {
            _tasks[task.id] = task;
            updateData(_values);
          },
        );
        return _values;
      default:
        return _values;
    }
  }

  Future<List<Task>> _add(AddTask action) async {
    updateStatus<TaskRepository>(InProgress());

    await Future.delayed(const Duration(seconds: 3));
    final task = Task.create(title: action.title);
    _tasks[task.id] = task;

    updateStatus<TaskRepository>(Free());

    Notification.showNotification('New Task was added');

    return _values;
  }
}
