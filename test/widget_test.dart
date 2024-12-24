// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yahya_button_and_text_filed/app/yahya_app.dart';


void main() {
  testWidgets('Settings screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const YahyaApp());

    // التحقق من وجود عنوان الإعدادات
    expect(find.text('الإعدادات'), findsOneWidget);

    // التحقق من وجود زر تغيير المظهر
    expect(find.text('تغيير المظهر'), findsOneWidget);

    // التحقق من وجود زر تغيير اللغة
    expect(find.text('تغيير اللغة'), findsOneWidget);

    // التحقق من وجود زر التبديل (Switch)
    expect(find.byType(Switch), findsOneWidget);

    // التحقق من وجود القائمة المنسدلة
    expect(find.byType(DropdownButton<String>), findsOneWidget);
  });
}
