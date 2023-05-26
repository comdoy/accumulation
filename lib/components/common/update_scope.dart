import 'package:flutter/material.dart';

/// 有时候就只是想单纯的刷新一下
class UpdateScope with ChangeNotifier {
  void update() {
    notifyListeners();
  }
}

class PagesScope with ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);

  void onChanged(int index) {
    pageController.jumpToPage(index);
  }

  void update() => notifyListeners();
}

class IndexScope with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void onChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}
