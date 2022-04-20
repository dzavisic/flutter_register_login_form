import 'package:flutter/material.dart';
import 'package:flutter_register_login_form_private/src/components/home.component.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomeComponent(title: 'Registration Form'),
    );
  }
}