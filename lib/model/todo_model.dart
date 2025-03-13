class TodoModel {
  String title;
  String subtitle;
  bool isDone;
  TodoModel(this.title, this.subtitle, this.isDone);

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'isDone': isDone,
  };
  TodoModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      subtitle = json['subtitle'],
      isDone = json['isDone'];
}
