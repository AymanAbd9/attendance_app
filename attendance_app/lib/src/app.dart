import 'package:attendance_app/src/screens/teacher_screens/teacher_class_details_screen.dart';
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
      // routes: {
      //   //TODO: specify student classroom details screen view here
      //   // WelcomeScreenView.routeName:(context) => const WelcomeScreenView(),
      //   // TeacherClassroomDetailScreenView.routeName: (context) => TeacherClassroomDetailScreenView(),
      // },
    );
  }
}
