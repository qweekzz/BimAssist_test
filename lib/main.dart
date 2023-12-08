import 'package:bim_assist_test/src/feature/page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      // тему не сделал
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage());
}

@immutable
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => const Placeholder();
}
