

import 'package:attendance_app/src/data_models/classroom_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClassroomProvider extends ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Classroom? classroom;

  void setTheClassroom(Classroom theClassroom) {
    classroom = theClassroom;
  }
}