import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  
  bool _darkTheme  =  false;
  bool _customTheme  =  false;
  ThemeData _currentTheme = ThemeData(
    useMaterial3: true,
    // Define the default brightness and colors.
    colorSchemeSeed: Colors.greenAccent,
  );

  ThemeChanger({required int theme}) {
    switch (theme) {
      case 1: // light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;

      case 2: // dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      case 3: // custom theme
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }

  }

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        primaryColor: const Color(0xff48A0EB),
        // colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
        scaffoldBackgroundColor: const Color(0xff16202B),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white
          )
        ),
        primaryColorLight: Colors.white
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

}