import 'package:attendance_app/src/data_models/classroom_model.dart';
import 'package:flutter/material.dart';

class TeacherClassroomDetailScreenView extends StatefulWidget {
  TeacherClassroomDetailScreenView({Key? key, required this.classroom}) : super(key: key);
  static const routeName = '/teacher_classroom_details_screen';
  final Classroom classroom;

  @override
  _TeacherClassroomDetailScreenViewState createState() =>
      _TeacherClassroomDetailScreenViewState();
}

class _TeacherClassroomDetailScreenViewState
    extends State<TeacherClassroomDetailScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.classroom.name!),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(widget.classroom.teacherName!),
      ),
    );
  }
}
