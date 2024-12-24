import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class TextFieldsScreen extends StatefulWidget {
  const TextFieldsScreen({super.key});

  @override
  State<TextFieldsScreen> createState() => _TextFieldsScreenState();
}

class _TextFieldsScreenState extends State<TextFieldsScreen> {
  final List<TextEditingController> controllers = [
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('الحقول النصية'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ...controllers.map((controller) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'أدخل النص هنا',
                ),
              ),
            )),
            const SizedBox(height: 20),
            CustomButton(
              text: 'مسح الحقول',
              buttonColor: Colors.red,
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