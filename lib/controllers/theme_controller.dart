import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Controller to manage theme state and persistence
class ThemeController extends GetxController {
  // GetStorage instance for persistence
  final _storage = GetStorage();
  
  // Storage key for theme mode
  static const String _themeKey = 'isDarkMode';
  
  // Observable for dark mode state
  final _isDarkMode = false.obs;
  
  /// Whether dark mode is enabled
  bool get isDarkMode => _isDarkMode.value;
  
  /// Current theme mode
  ThemeMode get themeMode => _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    // Load saved theme preference
    _loadThemeFromStorage();
  }

  /// Load theme preference from storage
  void _loadThemeFromStorage() {
    final savedTheme = _storage.read<bool>(_themeKey);
    if (savedTheme != null) {
      _isDarkMode.value = savedTheme;
    }
  }

  /// Toggle between light and dark theme
  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    _saveThemeToStorage();
    Get.changeThemeMode(themeMode);
  }

  /// Save theme preference to storage
  void _saveThemeToStorage() {
    _storage.write(_themeKey, _isDarkMode.value);
  }

  /// Set specific theme mode
  void setThemeMode(bool isDark) {
    _isDarkMode.value = isDark;
    _saveThemeToStorage();
    Get.changeThemeMode(themeMode);
  }
}
