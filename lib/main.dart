import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/domain/usecases/user/user_usecase.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/presentation/pages/authentication/login/login_screen.dart';
import 'package:todo/presentation/pages/dashboard/dashboard.dart';
import 'package:todo/presentation/utils/helper/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: locator<UserUsecase>().getUser().id.isEmpty
          ? const Login()
          : const Dashboard(),
    );
  }
}
