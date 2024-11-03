import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'home_screen.dart';
import 'voice_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Managerment Energy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/voice': (context) => const VoiceScreen(),
      },
    );
  }
}
