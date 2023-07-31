import 'package:flutter/material.dart';

import '../view/homepage.dart';
import '../view/project_page.dart';

class TaskManageProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  bool _isChecked = false;
  bool get isChecked => _isChecked;
  
  void setChecked(bool newValue) {
    _isChecked = newValue;
    notifyListeners();
  }

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final List<String> imagePaths = [
    "assets/people/image1.jpg",
    "assets/people/image2.jpeg",
    "assets/people/image3.jpg",
    "assets/people/image4.jpg",
    "assets/people/image5.jpeg",
  ];

  buildPage(int selectedIndex) {
    notifyListeners();
    switch (selectedIndex) {
      case 0:
        return MyHomePage();
      case 1:
        return ProjectPage();

      default:
        return MyHomePage();
    }
  }
}
