import 'package:attendance_app/src/screens/teacher_screens/teacher_class_details_screens/add_student_screen_view.dart';
import 'package:attendance_app/src/screens/teacher_screens/teacher_class_details_screen.dart';
import 'package:attendance_app/src/screens/teacher_screens/teacher_class_details_screens/teacher_edit_attendance_screen_view.dart';
import 'package:attendance_app/src/screens/teacher_screens/teacher_class_details_screens/teacher_show_qr_screen_view.dart';
import 'package:attendance_app/src/screens/teacher_screens/teacher_class_details_screens/teacher_view_attendance_screen_view.dart';
import 'package:flutter/material.dart';
import './screens/starter_screens/welcome_screen.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'attendance app',
      home: const WelcomeScreenView(),
      routes: {
        '/add_student': (context) => const AddStudentScreenView(),
        '/view_attendace':(context) => TeacherViewAttendanceScreenView(),
        '/show_qr': (context) => TeacherShowQrScreenView(),
        '/edit_attendace': (context) => TeacherEditAttendanceScreenView(),
      },
    );
  }
}
