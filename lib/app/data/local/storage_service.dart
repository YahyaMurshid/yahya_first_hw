import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _box = GetStorage();
  
  static Future<void> saveThemeMode(bool isDark) async {
    await _box.write('isDark', isDark);
  }

  static bool? loadThemeMode() {
    return _box.read('isDark');
  }

  static Future<void> saveLanguage(String langCode) async {
    await _box.write('language', langCode);
  }

  static String? loadLanguage() {
    return _box.read('language');
  }
} 