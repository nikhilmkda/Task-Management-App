import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/controller/task_manage_provider.dart';

// Custom widget for daily task item
class Daily_task_custom_widget extends StatelessWidget {
  final String text;
  final Color progressBarColor;
  final Color iconcolor;
  final double progress;
  final VoidCallback onTap;

  // Constructor to initialize the properties
  const Daily_task_custom_widget({
    Key? key,
    required this.text,
    required this.progressBarColor,
    required this.progress,
    required this.iconcolor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskManageProvider = Provider.of<TaskManageProvider>(context);

    // Return a widget that represents the custom daily task item.
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 166, // Replace with your desired width
          height: 80, // Replace with your desired height
          decoration: BoxDecoration(
            color: Colors.white60, // Use the progressBarColor parameter
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Icon representing the task status
              Icon(
                Icons.check_circle_rounded,
                color: iconcolor,
              ),

              const SizedBox(
                width: 14,
              ),

              // Column containing the task title and progress bar
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  // Task title
                  Text(
                    text,
                    style: titleTextSmall,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Progress bar
                  SizedBox(
                    width: 160,
                    height: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: progressBarColor.withOpacity(0.1),
                        valueColor: AlwaysStoppedAnimation<Color>(progressBarColor),
                      ),
                    ),
                  ),
                ],
              ),

              // Row containing user avatars
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

              // Icon for task details
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 15,
                ),
              )
            ],
          ),
        ),
      ),
    )
    .animate()
    .fade(delay: 200.ms)
    .then()
    .slideX(curve: Curves.easeIn, delay: 1000.ms);
  }
}
