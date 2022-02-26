import 'package:attendance_app/src/data_models/classroom_model.dart';
import 'package:flutter/material.dart';

class StudentClassDetailsScreenView extends StatelessWidget {
  const StudentClassDetailsScreenView({Key? key, required this.classroom}) : super(key: key);
    final Classroom classroom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
      child: const Text('class details screen'),
      ),
    );
  }
}
