import 'package:flutter/material.dart';
import 'package:orel_it_abithra/presentation/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(),
        child: HomeScreen(),
      ),
    );
  }
}


