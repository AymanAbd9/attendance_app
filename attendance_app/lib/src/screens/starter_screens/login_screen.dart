import 'package:flutter/material.dart';

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
                        keyboardType: TextInputType.number,
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text('email'),
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

                    const SizedBox(height: 30),

                    // password text field
                    Container(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
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
              // TODO: login the user
              onPressed: () {
                debugPrint('======> login screen');
                debugPrint('email: ====> ${emailController.text}');
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
