import 'package:attendance_app/src/screens/starter_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/src/services/auth_service.dart';

class StudentHomeScreen extends StatelessWidget {
  StudentHomeScreen({Key? key}) : super(key: key);
  final AuthService _authService = AuthService();
  static const routeName = 'student_home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton:
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () async {
                await _authService.logOut();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const WelcomeScreenView()),
                  ((route) => false),
                );
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        // scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: const [
          StudentButton(
            label: "Flutter",
            icon: Icons.list_alt,
            // route:
          ),
          StudentButton(
            label: "UX/UI",
            icon: Icons.qr_code_scanner_outlined,
            // route:
          ),
        ],
      ),
    );
  }
}

class StudentButton extends StatelessWidget {
  final String label;
  final IconData icon;
  // final String route;
  const StudentButton({
    Key? key,
    required this.label,
    required this.icon,
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
          borderRadius: BorderRadius.circular(30),
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
              Icon(this.icon),
              Text(this.label),
            ],
          ),
        ),
      ),
    );
  }
}
