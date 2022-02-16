import 'package:attendance_app/src/screens/starter_screens/welcome_screen.dart';
import 'package:attendance_app/src/screens/student_screens/student_home_screen.dart';
import 'package:attendance_app/src/screens/teacher_screens/teacher_home_screen.dart';
import 'package:attendance_app/src/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthHandler extends StatelessWidget {
  AuthHandler({Key? key}) : super(key: key);

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    User? user = _authService.user; //firebase auth user

    //checking with the firebase auth service for user
    if (user != null) {
      return Scaffold(
        backgroundColor: Colors.blue,
        body: FutureBuilder(
          future: _authService.fetchUserInfo(user.uid),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.data == null) {
              return const Text('empty');
            } else if (snapshot.data == true) {
              //is teacher  or is student
              if (_authService.generalUser!.isTeacher) {
                return TeacherHomeScreen(); // change it to teacher
              } else {
                return StudentHomeScreen();
              }
            }
            else {
              return const WelcomeScreenView();
            }
          },
        ),
      );
    } else {
      return const WelcomeScreenView(); //main screen for non authenticates users
    }
  }
}
