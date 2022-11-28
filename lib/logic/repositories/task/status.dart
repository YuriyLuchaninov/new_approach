abstract class TaskRepositoryStatus {}

class InProgress extends TaskRepositoryStatus {
  final int progress;

  InProgress(this.progress);
}

class Free extends TaskRepositoryStatus {}
