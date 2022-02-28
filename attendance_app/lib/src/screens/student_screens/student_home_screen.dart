import 'package:attendance_app/src/widgets/buttons/classroom_detail_buttons.dart';
import 'package:attendance_app/src/screens/starter_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/src/services/auth_service.dart';
import 'package:provider/provider.dart';

class StudentHomeScreenView extends StatelessWidget {
  StudentHomeScreenView({Key? key}) : super(key: key);
  static const routeName = 'student_home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton:
      appBar: AppBar(
        title: const Text('Student Home Page'),
        actions: [
          IconButton(
              onPressed: () async {
                await Provider.of<AuthService>(context, listen: false).logOut();
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
        children: generateButtons(),
        // children: const [
        //   // StudentButton(
        //   //   label: "Flutter",
        //   //   icon: Icons.list_alt,
        //   //   // route:
        //   // ),
        //   // StudentButton(
        //   //   label: "UX/UI",
        //   //   icon: Icons.qr_code_scanner_outlined,
        //   //   // route:
        //   // ),
        // ],
      ),
    );
  }
  List<Widget> generateButtons() {
    ClassroomDetailButtons _classroomDetailButtons = ClassroomDetailButtons();
    List<Widget> _widgets = [ ]; 
    _classroomDetailButtons.studentButtons!.forEach((key, value) { 
      _widgets.add(
        ElevatedButton(
          
          onPressed: () { 
          // navigate bo afsdasdf/value
          },
          child: Text(key))
      );
    });
    return _widgets;
}
}


