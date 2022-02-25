import 'package:attendance_app/src/data_models/general_user_model.dart';
import 'package:attendance_app/src/services/auth_service.dart';
import 'package:attendance_app/src/widgets/auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreenView extends StatelessWidget {
  RegisterScreenView({Key? key, required this.isTeacher}) : super(key: key);

  static const routeName = '/register_screen';

  final bool isTeacher;
  final AuthService  _authService = AuthService();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String? username = '';
  String? uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register',
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'email',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // username text field
                    Container(
                      child: TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: 'username',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

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
                  ],
                ),
              ),
            ),
            //submit button
            ElevatedButton(
              // TODO: register the user
              onPressed: () async {
                username = usernameController.text.trim();
                debugPrint('======> register screen');
                debugPrint('email: ====> ${emailController.text}');
                debugPrint('username: ====> $username');
                debugPrint('password: ====> ${passwordController.text}');
                debugPrint('teacher: ====> $isTeacher');
                await  Provider.of<AuthService>(context, listen: false).registerWithEmailAndPassword(
                    emailController.text, passwordController.text);

                GeneralUser _generalUser = GeneralUser(
                  uid:  Provider.of<AuthService>(context, listen: false).user!.uid,
                  email: emailController.text,
                  username: username!,
                  isTeacher: isTeacher,
                );

                 Provider.of<AuthService>(context, listen: false).setTheGUser(_generalUser);

                 Provider.of<AuthService>(context, listen: false).addtheUserToTheDatabase(_generalUser);
                
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
