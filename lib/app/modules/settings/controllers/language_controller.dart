import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/local/storage_service.dart';

class LanguageController extends GetxController {
  final _locale = const Locale('ar').obs;
  
  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  void _loadLanguage() {
    final savedLang = StorageService.loadLanguage();
    _locale.value = Locale(savedLang ?? 'ar');
  }

  void changeLanguage(String langCode) {
    _locale.value = Locale(langCode);
    Get.updateLocale(_locale.value);
    StorageService.saveLanguage(langCode);
  }
} 