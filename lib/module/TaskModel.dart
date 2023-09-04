class TaskModel {
  String? id;
  String? title;
  String? description;
  bool? isDone;

  TaskModel({this.title, this.description, this.id, this.isDone});

  TaskModel.fromFireStore(Map<String, dynamic> json)
      : this(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          isDone: json["isDone"],
        );

  // return TaskModel(
  //   id: json["id"], //key stored in database
  //   title: json["title"],
  //   description: json["description"],
  //   isDone: json["isDone"],
  // );

  Map<String, dynamic> toFireStore() {
    return {
      "id": id, //key of map and object
      "title": title,
      "description": description,
      "isDone": isDone,
    };
  }
}
