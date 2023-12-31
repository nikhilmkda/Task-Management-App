import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/view/widgets/custom_checkbox.dart';
import 'package:task_management_app_thiran_tech/model/fl_chart.dart';

import '../controller/task_manage_provider.dart';

class DashBoardDesign extends StatelessWidget {
  const DashBoardDesign({Key? key});

  @override
  Widget build(BuildContext context) {
    // Access the TaskManageProvider using Provider.of to get data for the dashboard.
    final taskManageProvider = Provider.of<TaskManageProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              // TODO: Implement the action when the back arrow button is pressed.
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black87,
            )),
        actions: [
          IconButton(
              onPressed: () {
                // TODO: Implement the action when the more vertical icon button is pressed.
              },
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.black87,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(children: [
          // Animated text for the title "Dashboard Design".
          const Text(
            "Dashboard Design",
            style: titleText,
          ).animate().slideX(curve: Curves.easeIn, delay: 1000.ms),

          const SizedBox(
            height: 15,
          ),

          // Animated text for the date and shared by information.
          Text(
            "Today, Shared by - Unbox Digital",
            style: secondaryText,
          ).animate().slideX(curve: Curves.easeIn, delay: 1000.ms),

          const SizedBox(
            height: 20,
          ),

          // Container for team information with CircularPercentIndicator and avatars.
          Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // CircularPercentIndicator to show the team's progress.
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 10),
                  child: CircularPercentIndicator(
                    radius: 50,
                    lineWidth: 9,
                    percent: 0.85,
                    progressColor: greenColor,
                    backgroundColor: greenColor.withOpacity(0.08),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: const Text(
                      "85%",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // Team information: avatars and deadline.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Team", style: titleTextSmall),
                    const SizedBox(
                      height: 10,
                    ),
                    // Display team avatars.
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
                                radius: 15,
                              ),
                            );
                          } else {
                            return Transform.translate(
                              offset: Offset(-8.0 * index, -0.0 * index),
                              child: const CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 15,
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
                      height: 10,
                    ),
                    const Text("Deadline", style: titleTextSmall),
                    const SizedBox(
                      height: 10,
                    ),
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
                          "July 25, 2021 - July 30, 2021",
                          style: secondaryText,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ).animate().slideX(curve: Curves.easeIn, delay: 1000.ms),

          const SizedBox(
            height: 45,
          ),

          // Animated text for "Project Progress".
          const Text(
            "Project Progress",
            style: titleText,
          ).animate().slideX(curve: Curves.easeIn, delay: 1000.ms),

          const SizedBox(
            height: 15,
          ),

          // Container for showing project progress checkboxes.
          Container(
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: CustomCheckbox(
                        containerColor: purpleColor,
                        iconColor: Colors.white,
                        borderColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Create user flow',
                      style: titleTextSmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: CustomCheckbox(
                        containerColor: purpleColor,
                        iconColor: Colors.white,
                        borderColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Create wireframe',
                      style: titleTextSmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: CustomCheckbox(
                        containerColor: Colors.white,
                        iconColor: Colors.grey,
                        borderColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Transform to visual design',
                      style: titleTextSmall,
                    ),
                  ],
                ),
              ],
            ),
          ).animate().slideX(curve: Curves.easeIn, delay: 1000.ms),

          const SizedBox(
            height: 45,
          ),

          // Animated text for "Project Overview".
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Project Overview",
                style: titleText,
              ).animate().slideX(curve: Curves.easeIn, delay: 1000.ms),
              Container(
                width: 65,
                height: 22,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Row(
                  children: [
                    Text(
                      ' Weekly',
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),

          // Container to show FLChart.
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "10 ",
                            style: secondaryText,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "5 ",
                            style: secondaryText,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "2 ",
                            style: secondaryText,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "0 ",
                            style: secondaryText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 150,
                        child: MyCurvedChart(), // The chart page is called here.
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Sun",
                        style: secondaryText,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Mon",
                        style: secondaryText,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Tue",
                        style: secondaryText,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Wed",
                        style: secondaryText,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Thu",
                        style: secondaryText,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Fri",
                        style: secondaryText,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Sat",
                        style: secondaryText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ).animate().slideY(curve: Curves.easeIn, delay: 1000.ms),
        ]),
      ),
    );
  }
}
