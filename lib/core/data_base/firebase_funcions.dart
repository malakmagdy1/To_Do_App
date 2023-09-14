import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/module/TaskModel.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(fromFirestore: (snapshot, _) {
      return TaskModel.fromJson(snapshot.data()!);
    }, toFirestore: (value, _) {
      return value.toJson();
    });
  }

  // create collection then
  // id (auto generated)
  // field (date,title,description)
  // type(string,int)
  // value(eeh eltask b2a) data enter in firebase
  static Future<void> addTask(TaskModel taskModel) {
    var collection = getTaskCollection();
    var docRef = collection.doc(); //.add .delete
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }
}
