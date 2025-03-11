class TodoModel {
  String title;
  String subtile;
  bool isDone;

  TodoModel({required this.title, required this.subtile, this.isDone = false});

  bool? get isCompleted => null;
}
