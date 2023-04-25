class TaskPost {
  String _task;

  TaskPost(this._task);

  String get task => _task;

  set task(String value) {
    _task = value;
  }
}