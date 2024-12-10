import 'package:flutter/material.dart';
import 'screens/yahya_text_fields_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق الحقول النصية',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
      ),
      home: const YahyaTextFieldsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
