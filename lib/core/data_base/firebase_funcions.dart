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
    var doc = collection.doc(); //.add .delete
    taskModel.id = doc.id;
    return doc.set(taskModel);
  }

  static Future<List<TaskModel>> getData() async {
    var snapshots = await getTaskCollection().get();
    List<TaskModel> taskslist = snapshots.docs.map((e) => e.data()).toList();
    return taskslist;
  }

  static Stream<QuerySnapshot<TaskModel>> getRealTimeData() {
    return getTaskCollection().snapshots();
  }

  static Future<void> deleteTask(TaskModel taskModel) {
    var collection = getTaskCollection().doc(taskModel.id);
    return collection.delete();
  }
}
