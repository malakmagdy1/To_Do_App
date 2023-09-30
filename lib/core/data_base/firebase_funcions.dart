import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/module/TaskModel.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance //take instance from collection
        .collection("Tasks") //collecion name
        .withConverter<TaskModel>(fromFirestore: (snapshot, _) {
      //snapshot map hold data in fromfirebase
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
    var doc = collection.doc(); //.add .delete
    taskModel.id = doc.id;
    return collection.add(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getData(DateTime dateTime) {
    var collection = getTaskCollection();
    return collection
        .where("date", isEqualTo: dateTime.millisecondsSinceEpoch)
        .snapshots();
  }

  static Stream<QuerySnapshot<TaskModel>> getRealTimeData() {
    return getTaskCollection().snapshots();
  }

  static Future<void> deleteTask(TaskModel taskModel) {
    var collection = getTaskCollection();
    var doc = collection.doc(taskModel.id);
    return doc.delete();
  }
}
