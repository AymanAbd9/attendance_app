import 'package:attendance_app/src/data_models/class_model.dart';
import 'package:attendance_app/src/screens/starter_screens/welcome_screen.dart';
import 'package:attendance_app/src/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/src/services/auth_service.dart';
import 'package:provider/provider.dart';

class TeacherHomeScreen extends StatefulWidget {
  TeacherHomeScreen({Key? key}) : super(key: key);
  static const routeName = 'teacher_home_screen';

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {

  // TODO: get the general user after logging in (in here or in login_screen)
  


  final FirestoreService _firestoreService = FirestoreService();

  ClassRoom? classRoom;
  var classNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Home Page'),
        actions: [
          IconButton(
              onPressed: () async {
                await  Provider.of<AuthService>(context, listen: false).logOut();
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
          TeacherButton(
            label: "Flutter",
            icon: Icons.list_alt,
            // route:
          ),
          TeacherButton(
            label: "UX/UI",
            icon: Icons.qr_code_scanner_outlined,
            // route:
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (ctx) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: AlertDialog(
                    alignment: Alignment.center,
                    title: const Text('Create class'),
                    content: Container(
                      height: 180,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextField(
                            controller: classNameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: 'class name',
                            ),
                          ),
                          // const SizedBox(height: 50),
                          ElevatedButton(
                              onPressed: () {
                                classRoom = ClassRoom(
                                  name: classNameController.text.trim(),
                                  ownerName: Provider.of<AuthService>(context, listen: false).generalUser!.username,
                                  participants: 0,
                                );

                                // debugPrint('======> ${authProvider.ge}');
                                debugPrint(
                                    '======> ${classRoom!.name}');
                                debugPrint('======> ${classRoom!.ownerName}');
                              },
                              child: const Text('create class'))
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

class TeacherButton extends StatelessWidget {
  final String label;
  final IconData icon;
  // final String route;
  const TeacherButton({
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
        color: Colors.blue,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            // Navigator.pushNamed(context, route);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
