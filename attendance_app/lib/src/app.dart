import 'package:flutter/material.dart';
import './screens/starter_screens/welcome_screen.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'attendance app',
      home: const WelcomeScreenView(),
      // routes: {
      //   WelcomeScreenView.routeName:(context) => const WelcomeScreenView(),
      // //   RegisterScreenView.routeName: (context) => RegisterScreenView(),
      // //   LoginScreenView.routeName: (context) => LoginScreenView(),
      // },
    );
  }
}
