import 'package:attendance_app/src/screens/starter_screens/start_screen.dart';
import 'package:flutter/material.dart';


class WelcomeScreenView extends StatelessWidget {
  const WelcomeScreenView({Key? key}) : super(key: key);

    static const routeName = '/welcome_screen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome'), centerTitle: true,),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(40),
          padding: const EdgeInsets.all(40),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Choose your role', textAlign: TextAlign.center, style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              
              ),),
              const SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=> StartScreenView(isTeacher: false,)));
                },
                child: const Text('Student'),
              ),
            const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => StartScreenView(isTeacher: true,)));
                },
                child: const Text('Teacher'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
