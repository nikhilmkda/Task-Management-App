import 'package:flutter/material.dart';



class TaskManageProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex =>
      _selectedIndex; //index using to select page change in bottom navigation bar

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

//image list of project members
  final List<String> imagePaths = [
    "assets/people/image1.jpg",
    "assets/people/image2.jpeg",
    "assets/people/image3.jpg",
    "assets/people/image4.jpg",
    "assets/people/image5.jpeg",
  ];
}
