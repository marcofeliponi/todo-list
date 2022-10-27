import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task.dart';

class DatabaseService {
  DatabaseReference ref = FirebaseDatabase.instance.ref('tasks');
  late Object? task;

  @override
  void initState() {
    // init();
  }

  // init() async {
  //   try {
  //     final taskSnapshot = await ref.get();
  //     task = taskSnapshot.value as String;
  //   } catch (err) {
  //     debugPrint(err.toString());
  //   }
  //
  //   var taskSubscription = ref.onValue.listen((DatabaseEvent event) {
  //     task = (event.snapshot.value ?? {}) as String;
  //   });
  // }

  insertTask(Task task) async {
    try {
      await ref.set(task.toMap());
    } catch (err) {
      debugPrint('insertTask error -> ${err.toString()}');
    }
  }

  getTasks() async {
    try {
      final taskSnapshot = await ref.get();
      task = taskSnapshot.value;
    } catch (err) {
      debugPrint(err.toString());
    }

    var taskSubscription = ref.onValue.listen((DatabaseEvent event) {
      task = (event.snapshot.value ?? 'Sem dados');
    });

    return task;
  }
}
