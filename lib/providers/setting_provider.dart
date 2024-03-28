
import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier{
  String appLanguage = 'en' ;

  void changeAppLanguage(String? selectedLanguage){
    if(selectedLanguage!=null){
      appLanguage = selectedLanguage;
      notifyListeners();
      print(appLanguage);
    }
  }
}