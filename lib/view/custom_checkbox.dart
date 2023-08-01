import 'package:flutter/material.dart';
// checkbox that using in dashboard design page 
class CustomCheckbox extends StatelessWidget {
  final Color containerColor;
  final Color iconColor;
  final Color borderColor;
  const CustomCheckbox(
      {super.key,
      required this.containerColor,
      required this.iconColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: containerColor,
          border: Border.all(width: 2, color: borderColor)),
      child: Padding(
        padding: const EdgeInsets.only(right: 4, left: 0),
        child: Icon(
          Icons.check,
          color: iconColor,
          size: 17,
        ),
      ),
    );
  }
}
