import 'package:flutter/material.dart';

class RegisterScreenView extends StatelessWidget {
  RegisterScreenView({Key? key, required this.isTeacher}) : super(key: key);

  static const routeName = '/register_screen';

  final bool isTeacher;

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
                        keyboardType: TextInputType.name,
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
              onPressed: () {
                username = usernameController.text.trim();
                 debugPrint('======> register screen');
                  debugPrint('email: ====> ${emailController.text}');
                  debugPrint('username: ====> $username');
                  debugPrint('password: ====> ${passwordController.text}');
                  debugPrint('teacher: ====> $isTeacher');
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