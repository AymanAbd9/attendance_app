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
    return _firebaseFirestore.collection('classes').snapshots().map(
          (v) => v.docs
              .map(
                (e) => Classroom.fromMap(e.data()),
              )
              .toList(),
        );
  }
}