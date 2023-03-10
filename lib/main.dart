import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ruber/pages/home/home.dart';
import 'package:ruber/repositories/user_repository.dart';
import 'package:ruber/ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    UserRepository.instance.signInCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RUber',
      theme: AppTheme.theme,
      home: HomePage(),
    );
  }
}
