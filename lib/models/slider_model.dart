
import 'package:flutter/material.dart';

class SliderModel extends ChangeNotifier{
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners(); // notifica el nuevo valor a los widgets que esten escuchando 
  }
}