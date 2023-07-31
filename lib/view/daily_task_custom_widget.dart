import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/controller/task_manage_provider.dart';

class Daily_task_custom_widget extends StatelessWidget {
  final String text;

  final Color progressBarColor;
  final Color iconcolor;
  final double progress;

  const Daily_task_custom_widget({
    Key? key,
    required this.text,
    required this.progressBarColor,
    required this.progress,
    required this.iconcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskManageProvider = Provider.of<TaskManageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 166, // Replace with your desired width
        height: 80, // Replace with your desired height
        decoration: BoxDecoration(
          color: Colors.white60, // Use the containerColor parameter
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: iconcolor,
            ),
            SizedBox(
              width: 14,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  text,
                  style: titleTextSmall,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 160,
                  height: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: progressBarColor.withOpacity(0.1),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(progressBarColor),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(
                  taskManageProvider.imagePaths.length,
                  (index) {
                    return Transform.translate(
                      offset: Offset(-8.0 * index, -0.0 * index),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          taskManageProvider.imagePaths[index],
                        ),
                        radius: 10,
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
