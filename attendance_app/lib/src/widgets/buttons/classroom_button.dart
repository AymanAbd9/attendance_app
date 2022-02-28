import 'package:attendance_app/src/data_models/classroom_model.dart';
import 'package:attendance_app/src/screens/student_screens/student_classroom_details_screen.dart';
import 'package:attendance_app/src/screens/teacher_screens/teacher_class_details_screen.dart';
import 'package:attendance_app/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance_app/src/providers/classroom_proivder.dart';

class ClassroomButton extends StatefulWidget {
  final Classroom classroom;
  // final String route;
  const ClassroomButton({
    Key? key,
    required this.classroom,

    // required this.route,
  }) : super(key: key);

  @override
  State<ClassroomButton> createState() => _ClassroomButtonState();
}

class _ClassroomButtonState extends State<ClassroomButton> {


  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.cyan,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Provider.of<AuthService>(context, listen: false).generalUser!.isTeacher == true
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => TeacherClassroomDetailScreenView(
                          classroom: widget.classroom),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => StudentClassDetailsScreenView(
                          classroom: widget.classroom),
                    ),
                  );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.classroom.name!),
            ],
          ),
        ),
      ),
    );
  }
}
