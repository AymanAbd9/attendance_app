import 'package:attendance_app/src/widgets/auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/src/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({Key? key, required this.isTeacher}) : super(key: key);

  static const routeName = '/login_screen';

  final bool isTeacher;
  final emailController = TextEditingController();
  String? email;

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            Form(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // email text field
                    Container(
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text('email'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // password text field
                    Container(
                      child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          label: Text('password'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        obscureText: true,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                //error
                Provider.of<AuthService>(context).theError == null
                    ? Container()
                    : Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                        child: Text(
                          Provider.of<AuthService>(context).theError!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),

                  ],
                ),
              ),
            ),


            

            //submit button
            ElevatedButton(
              onPressed: () async {
                // debugPrint('======> login screen');
                // debugPrint('email: ====> ${emailController.text}');
                // debugPrint('password: ====> ${passwordController.text}');
                // debugPrint('teacher: ====> $isTeacher');

                await Provider.of<AuthService>(context, listen: false)
                    .loginWithEmailAndPassword(
                        emailController.text,
                        passwordController.text)
                    .then((value) async {
                  await Provider.of<AuthService>(context, listen: false)
                      .fetchUserInfo(value!.user!.uid);
                  debugPrint(
                      'login screen =================> ${Provider.of<AuthService>(context, listen: false).generalUser!.username}');
                });
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => AuthHandler()),
                  ((route) => false),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
