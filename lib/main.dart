import 'package:flutter/material.dart';
import 'package:project1/auth/login.dart'; // ✅ fixed package name

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // optional for Material 3 look
      ),
      home: const LoginForm(),
      debugShowCheckedModeBanner: false, // optional, removes debug banner
    );
  }
}
