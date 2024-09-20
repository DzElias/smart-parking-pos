import 'package:flutter/material.dart';
import 'features/pay_parking/presentation/pages/pay_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS Parking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PayPage(),
    );
  }
}
