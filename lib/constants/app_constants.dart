import 'package:flutter/material.dart';

class AppConstants {
  // ألوان التطبيق
  static final primaryColor = Colors.blue.shade700;
  static final errorColor = Colors.red.shade700;
  static final successColor = Colors.green.shade700;
  
  // رسائل التطبيق
  static const String formSuccessMessage = 'تم حفظ البيانات بنجاح';
  static const String formClearMessage = 'تم مسح جميع الحقول بنجاح';
  static const String termsRequiredMessage = 'يجب الموافقة على الشروط والأحكام';
  
  // أنماط التحقق
  static final phonePattern = RegExp(r'^7[0137]\d{7}$');
  static final emailPattern = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,4}$');
} 