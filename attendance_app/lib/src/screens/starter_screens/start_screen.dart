import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'login_screen.dart';

class StartScreenView extends StatelessWidget {
  const StartScreenView({Key? key, required this.isTeacher}) : super(key: key);

    static const routeName = '/starter_screen';
    final bool isTeacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: isTeacher? const Text('Welcome Teacher') : const Text('Welcome Student'), centerTitle: true,),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(40),
          padding: const EdgeInsets.all(40),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Attendance System', textAlign: TextAlign.center, style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              
              ),),
              const SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => RegisterScreenView(isTeacher: isTeacher)));
                },
                child: const Text('Register'),
              ),
            const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreenView(isTeacher: isTeacher)));
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
