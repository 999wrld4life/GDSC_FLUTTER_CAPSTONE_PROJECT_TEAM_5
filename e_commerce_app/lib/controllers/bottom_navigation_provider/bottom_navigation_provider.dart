import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }
}
