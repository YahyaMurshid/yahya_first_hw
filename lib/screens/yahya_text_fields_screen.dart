import 'package:flutter/material.dart';
import '../widgets/yahya_custom_button.dart';

class YahyaTextFieldsScreen extends StatefulWidget {
  const YahyaTextFieldsScreen({Key? key}) : super(key: key);

  @override
  State<YahyaTextFieldsScreen> createState() => _YahyaTextFieldsScreenState();
}

class _YahyaTextFieldsScreenState extends State<YahyaTextFieldsScreen> {
  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  void clearFields() {
    for (var controller in controllers) {
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> hintTexts = [
      'أدخل اسمك الكامل',
      'أدخل رقم الهاتف',
      'أدخل البريد الإلكتروني',
      'أدخل العنوان',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('الحقول النصية'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ...List.generate(
              controllers.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextField(
                  controller: controllers[index],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: hintTexts[index],
                    hintStyle: const TextStyle(
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            YahyaCustomButton(
              text: 'مسح الحقول',
              buttonColor: Colors.blue,
              onPressed: clearFields,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}