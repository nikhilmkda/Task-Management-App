import 'package:flutter/material.dart';

class TaskManageProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex =>
      _selectedIndex; // The index used to select page changes in the bottom navigation bar.

  // Method to update the selected index and notify listeners of the change.
  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // A list of image paths representing project members.
  final List<String> imagePaths = [
    "assets/people/image1.jpg",
    "assets/people/image2.jpeg",
    "assets/people/image3.jpg",
    "assets/people/image4.jpg",
    "assets/people/image5.jpeg",
  ];
}
