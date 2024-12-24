import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/local/storage_service.dart';

class ThemeController extends GetxController {
  final _isDarkMode = false.obs;
  
  bool get isDarkMode => _isDarkMode.value;

  @override
  void onInit() {
    super.onInit();
    _loadThemeMode();
  }

  void _loadThemeMode() {
    final savedTheme = StorageService.loadThemeMode();
    _isDarkMode.value = savedTheme ?? false;
  }

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    StorageService.saveThemeMode(_isDarkMode.value);
  }
} 