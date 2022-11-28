import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'ui/index.dart';
import 'logic/index.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final logic = LogicInterface();
  final taskRepository = TaskRepository();

  @override
  void dispose() async {
    await Future.wait([
      taskRepository.dispose(),
      // todo: at this point, you need to add other data repositories
    ]).catchError((e) {
      debugPrint(e);
    });
    await logic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BLoI>(create: (_) => logic),
        StreamProvider<List<Task>>.value(
          value: taskRepository.stream,
          initialData: const <Task>[],
        ),
      ],
      child: const OverlaySupport.global(
        child: MaterialApp(
          title: 'Logic Demo',
          home: TaskListScreen(),
        ),
      ),
    );
  }
}
