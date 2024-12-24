import 'package:flutter/material.dart';
import '../screens/yahya_text_fields_screen.dart';

class YahyaApp extends StatelessWidget {
  const YahyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نموذج التسجيل',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: const YahyaTextFieldsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
} 