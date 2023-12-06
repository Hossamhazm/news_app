import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier{
  String _selectedLanguage = 'English';
  String get selectedLanguage => _selectedLanguage;

  SettingProvider(){
    _selectedLanguage = "English";
    _loadLanguageFromPreferences();
  }

  void toggleLanguage(String value){
    _selectedLanguage = value!;
    _saveLanguageToPreferences();
    notifyListeners();
  }
  Future<void> _loadLanguageFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedLanguage = prefs.getString('lang') ?? "English";
    notifyListeners();
  }
  Future<void> _saveLanguageToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', _selectedLanguage);
  }

}