import 'package:flutter/material.dart';

class CustomContainerSquareBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color containerColor;

  const CustomContainerSquareBox(
      {super.key,
      required this.icon,
      required this.text,
      required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 166,
        height: 100, 
        decoration: BoxDecoration(
          color: containerColor, 
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 20,
                color: Colors.white), 
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
