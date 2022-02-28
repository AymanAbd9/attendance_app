import 'package:attendance_app/src/data_models/classroom_model.dart';
import 'package:attendance_app/src/providers/classroom_proivder.dart';
import 'package:attendance_app/src/widgets/buttons/classroom_detail_buttons.dart';
import 'package:attendance_app/src/widgets/buttons/teacher_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherClassroomDetailScreenView extends StatefulWidget {
  TeacherClassroomDetailScreenView({Key? key, required this.classroom})
      : super(key: key);
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
    Provider.of<ClassroomProvider>(context, listen: false)
        .setTheClassroom(widget.classroom);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.classroom.name!),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: generateButtons(),
        ),
      ),
    );
  }

  List<Widget> generateButtons() {
    ClassroomDetailButtons _classroomDetailButtons = ClassroomDetailButtons();
    List<Widget> _widgets = [];
    _classroomDetailButtons.teacherButtons!.forEach((key, value) {
      _widgets.add(
        // TeacherButton(
        //   label: widget.classroom.name!,
        //   route: value,
        // ),
        ElevatedButton(onPressed: () {
          Navigator.of(context).pushNamed(value);
        }, child: Text(key))
      );
    });
    return _widgets;
  }
}
