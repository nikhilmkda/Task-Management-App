import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';

import '../../controller/task_manage_provider.dart';

class AllProjectTile extends StatelessWidget {
  // Properties of the AllProjectTile
  final String title;
  final String date;
  final String secondDate;
  final String percentage;
  final double percentageNum;
  final Color percentageColor;
  final VoidCallback onTap;

  // Constructor to initialize the properties
  const AllProjectTile({
    super.key,
    required this.title,
    required this.date,
    required this.percentageNum,
    required this.percentageColor,
    required this.secondDate,
    required this.percentage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Access the TaskManageProvider using Provider to get the project member image paths.
    final taskManageProvider = Provider.of<TaskManageProvider>(context);

    // Return an InkWell that responds to taps.
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 0, left: 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 170,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Title
                    Text(
                      title,
                      style: titleTextSmall,
                    )
                        .animate()
                        .fade(delay: 500.ms)
                        .slideX(curve: Curves.easeIn, delay: 1000.ms),

                    const SizedBox(
                      height: 12,
                    ),

                    // Project Date
                    Text(
                      date,
                      style: secondaryText,
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    // "Team" label
                    const Text("Team", style: titleTextSmall),
                    const SizedBox(
                      height: 12,
                    ),

                    // Project Team Members (avatars)
                    Row(
                      children: List.generate(
                        taskManageProvider.imagePaths.length + 1,
                        (index) {
                          if (index < taskManageProvider.imagePaths.length) {
                            return Transform.translate(
                              offset: Offset(-8.0 * index, -0.0 * index),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    taskManageProvider.imagePaths[index]),
                                radius: 14,
                              ),
                            );
                          } else {
                            return Transform.translate(
                              offset: Offset(-8.0 * index, -0.0 * index),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 14,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            );
                          }
                        },
                      ).toList(),
                    ),

                    const SizedBox(
                      height: 14,
                    ),

                    // Project Deadline
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.grey.withOpacity(0.8),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          secondDate,
                          style: secondaryText,
                        ),
                      ],
                    ),
                  ],
                ),

                // CircularPercentIndicator to show the project progress percentage
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 15),
                  child: CircularPercentIndicator(
                    radius: 42,
                    lineWidth: 8,
                    percent: percentageNum,
                    progressColor: percentageColor,
                    backgroundColor: percentageColor.withOpacity(0.08),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      percentage,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                      .animate()
                      .fade()
                      .then()
                      .slide(duration: 2000.ms, curve: Curves.bounceInOut),
                ),
              ],
            ),
          ),
        ),
      ).animate().fade(delay: 500.ms),
    );
  }
}
