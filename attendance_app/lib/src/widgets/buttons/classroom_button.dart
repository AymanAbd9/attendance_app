

import 'package:attendance_app/src/data_models/classroom_model.dart';
import 'package:flutter/material.dart';

class ClassroomButton extends StatelessWidget {
  final Classroom classroom;
  // final String route;
  const ClassroomButton({
    Key? key, required this.classroom,
    
    // required this.route,
  }) : super(key: key);

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
            // Navigator.pushNamed(context, route);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(classroom.name!),
            ],
          ),
        ),
      ),
    );
  }
}