import 'package:flutter/material.dart';
import 'package:flutter_validation_provider/signup.dart';
import 'package:flutter_validation_provider/signup_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(primaryColor: Colors.orange),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpModel>(
        builder: (_) => SignUpModel(), child: SignUp());
  }
}
