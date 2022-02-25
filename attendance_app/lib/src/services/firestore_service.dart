import 'package:attendance_app/src/data_models/class_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  //adding a new class to firestore "classes" collection
  Future<void> createClass(ClassRoom classRoom) async {
    await _firebaseFirestore
        .collection('classes')
        .add(classRoom.toMap())
        .then((value) => debugPrint('success in creating a class'))
        .onError((error, stackTrace) => debugPrint(error.toString()));
  }

  //read a stream of classes to the screen
  Stream<List<ClassRoom>> streamOfClassRooms() {
    return _firebaseFirestore.collection('classes').snapshots().map(
          (v) => v.docs
              .map(
                (e) => ClassRoom.fromMap(e.data()),
              )
              .toList(),
        );
  }
}