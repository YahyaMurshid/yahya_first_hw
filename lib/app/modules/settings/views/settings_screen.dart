import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../controllers/language_controller.dart';

class SettingsScreen extends GetView<ThemeController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageController = Get.find<LanguageController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Theme Switch
            Obx(() => SwitchListTile(
              title: Text('change_theme'.tr),
              subtitle: Text(controller.isDarkMode 
                ? 'dark_mode'.tr 
                : 'light_mode'.tr),
              value: controller.isDarkMode,
              onChanged: (value) => controller.toggleTheme(),
            )),
            
            const Divider(),
            
            // Language Selection
            ListTile(
              title: Text('change_language'.tr),
              trailing: DropdownButton<String>(
                value: languageController.locale.languageCode,
                items: [
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text('arabic'.tr),
                  ),
                  DropdownMenuItem(
                    value: 'en',
                    child: Text('english'.tr),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    languageController.changeLanguage(value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 