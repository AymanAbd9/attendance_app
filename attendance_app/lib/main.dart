import 'package:attendance_app/src/providers/classroom_proivder.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((_) => debugPrint("firebase initialized"));
  runApp(MultiProvider(
        child:  const AppView(),
        providers: [
          ChangeNotifierProvider(create: (_) => AuthService()),
          ChangeNotifierProvider(create: (_) => ClassroomProvider(),)
        ],
      ));
}

