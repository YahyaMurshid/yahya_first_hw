import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/core/localization/translations.dart';
import 'app/modules/settings/controllers/theme_controller.dart';
import 'app/modules/settings/controllers/language_controller.dart';
import 'app/modules/settings/views/settings_screen.dart';

void main() async {
  await GetStorage.init();
  
  final themeController = Get.put(ThemeController());
  final languageController = Get.put(LanguageController());

  runApp(
    GetMaterialApp(
      title: 'Yahya App',
      translations: AppTranslations(),
      locale: languageController.locale,
      fallbackLocale: const Locale('ar'),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const SettingsScreen(),
    ),
  );
}
