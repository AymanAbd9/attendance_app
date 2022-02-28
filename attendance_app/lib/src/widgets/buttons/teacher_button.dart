

import 'package:flutter/material.dart';

class TeacherButton extends StatelessWidget {
  final String label;
  // final IconData icon;
  final String route;
  const TeacherButton({
    Key? key,
    required this.label,
    // required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.blue,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(icon),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}









