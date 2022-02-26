import 'package:attendance_app/src/data_models/classroom_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //adding a new class to firestore "classes" collection
  Future<void> createClassroom(Classroom classroom) async {
    await _firebaseFirestore
        .collection('classes')
        .add(classroom.toMap())
        .then((value) => debugPrint('=============> classroom created'))
        .onError((error, stackTrace) => debugPrint(error.toString()));
  }

  //read a stream of classes to the screen
  Stream<List<Classroom>> streamOfClassrooms() {
    return _firebaseFirestore
        .collection('classes')
        .orderBy('name')
        .snapshots()
        .map(
          (querySnapshot) => querySnapshot.docs
              .map(
                (doc) => Classroom.fromMap(doc.data()),
              )
              .toList(),
        );
  }

  Future<void> deleteAllClassroomDocs() async {
    var collection = FirebaseFirestore.instance.collection('classes');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}
