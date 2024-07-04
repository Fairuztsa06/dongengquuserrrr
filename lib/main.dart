import 'package:flutter/material.dart';
import 'ui/beranda.dart';
import 'ui/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dongeng',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/beranda': (context) => const Beranda(),
        '/login': (context) => const Login(),
      },
    );
  }
}
