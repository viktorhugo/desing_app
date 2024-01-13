import 'package:desing_app/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutProvider with ChangeNotifier {

  Widget _currentPage = const SlideShowPage();

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;

}