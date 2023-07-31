import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';

import '../controller/task_manage_provider.dart';

class AllProjectTile extends StatelessWidget {
  final String title;
  final String date;
  final String secondDate;
  final String percentage;
  final double percentageNum;
  final Color percentageColor;
  final VoidCallback onTap;
  const AllProjectTile(
      {super.key,
      required this.title,
      required this.date,
      required this.percentageNum,
      required this.percentageColor,
      required this.secondDate,
      required this.percentage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final taskManageProvider = Provider.of<TaskManageProvider>(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 0, left: 0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 251, 251),
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 170,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //  SizedBox(
                  //   height: 15,
                  // ),
                  Text(
                    title,
                    style: titleTextSmall,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    date,
                    style: secondaryText,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text("Team", style: titleTextSmall),
                  SizedBox(
                    height: 12,
                  ),
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
                            child: CircleAvatar(
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
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.grey.withOpacity(0.8),
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        secondDate,
                        style: secondaryText,
                      ),
                    ],
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CircularPercentIndicator(
                    radius: 45,
                    lineWidth: 9,
                    percent: percentageNum,
                    progressColor: percentageColor,
                    backgroundColor: percentageColor.withOpacity(0.08),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      percentage,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
