import 'package:attendance_app/src/data_models/classroom_model.dart';
import 'package:attendance_app/src/screens/starter_screens/welcome_screen.dart';
import 'package:attendance_app/src/screens/teacher_screens/teacher_class_details_screen.dart';
import 'package:attendance_app/src/services/firestore_service.dart';
import 'package:attendance_app/src/widgets/buttons/classroom_button.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/src/services/auth_service.dart';
import 'package:provider/provider.dart';

class TeacherHomeScreenView extends StatefulWidget {
  TeacherHomeScreenView({Key? key}) : super(key: key);
  static const routeName = 'teacher_home_screen';

  @override
  State<TeacherHomeScreenView> createState() => _TeacherHomeScreenViewState();
}

class _TeacherHomeScreenViewState extends State<TeacherHomeScreenView> {

  final FirestoreService _firestoreService = FirestoreService();

  Classroom? classroom;
  var classNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Home Page'),
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
      body: StreamBuilder<List<Classroom>>(
        stream: _firestoreService.streamOfClassrooms(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            debugPrint('==========> teacher screen:  ${snapshot.error}');
            return const Text('an error has occured');
          } else if (snapshot.data!.isEmpty) {
            return const Center(child: Text('no classes'));
          } else {
            // return ListView.builder(
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, index) {
            //     return ClassroomButton(classroom: snapshot.data![index]);
            //   });
            // debugPrint(snapshot.data!.length.toString());
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    ),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ClassroomButton(classroom: snapshot.data![index]);
                  
                });
          }
        },
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
                              onPressed: () async {
                                classroom = Classroom(
                                  name: classNameController.text.trim(),
                                  teacherName: Provider.of<AuthService>(context,
                                          listen: false)
                                      .generalUser!
                                      .username,
                                  participants: 0,
                                  uid: Provider.of<AuthService>(context, listen: false).user!.uid,
                                );

                                debugPrint('======> ${classroom!.name}');
                                debugPrint('======> ${classroom!.teacherName}');
                                await _firestoreService
                                    .createClassroom(classroom!).then((value) => classNameController.clear());
                                Navigator.of(context).pop();
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




// return GridView.count(
//             // Create a grid with 2 columns. If you change the scrollDirection to
//             // horizontal, this produces 2 rows.
//             // scrollDirection: Axis.horizontal,
//             crossAxisCount: 2,
//             crossAxisSpacing: 5,
//             mainAxisSpacing: 5,
//             children: const [
//               TeacherButton(
//                 label: "Flutter",
//                 icon: Icons.list_alt,
//                 // route:
//               ),
//               TeacherButton(
//                 label: "UX/UI",
//                 icon: Icons.qr_code_scanner_outlined,
//                 // route:
//               ),
//             ],
//           );
