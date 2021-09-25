import 'package:custom_painter/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = const SlideshowPage();

  Widget get currentPage => _currentPage;
  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }
}
