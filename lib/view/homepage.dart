import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/view/custom_container.dart';
import 'package:task_management_app_thiran_tech/view/daily_task_custom_widget.dart';

import '../controller/task_manage_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage("assets/people/image1.jpg")
                  // You can use AssetImage('path_to_local_image') for local images.
                  ),
              IconButton(
                icon: Icon(
                  Icons.search_rounded,
                  size: 35,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          const Text(
            'Hello',
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          const Text('Alex Marconi', style: headLineText),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Row(
                children: [
                  CustomContainerSquareBox(
                      icon: Icons.update_rounded,
                      text: "In Progress",
                      containerColor: orangeColor),
                  CustomContainerSquareBox(
                      icon: Icons.cached_outlined,
                      text: "Ongoing",
                      containerColor: purpleColor),
                ],
              ),
              Row(
                children: [
                  CustomContainerSquareBox(
                      icon: Icons.file_copy_outlined,
                      text: "completed",
                      containerColor: greenColor),
                  CustomContainerSquareBox(
                      icon: Icons.cancel_sharp,
                      text: "Cancel",
                      containerColor: redColor),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Daily Task",
                style: titleText,
              ),
              Row(
                children: [
                  Text(
                    "All Task",
                    style: secondaryText,
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
          Daily_task_custom_widget(
            text: "App Animation",
            progress: 0.7,
            progressBarColor: purpleColor,
            iconcolor: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Daily_task_custom_widget(
            text: "Dashboard Design",
            progress: 1,
            progressBarColor: greenColor,
            iconcolor: Colors.green,
          ),
          SizedBox(
            height: 5,
          ),
          Daily_task_custom_widget(
            text: "UI/UX Design",
            progress: 0.4,
            progressBarColor: orangeColor,
            iconcolor: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Daily_task_custom_widget(
            text: "Interaction Design",
            progress: 0.2,
            progressBarColor: redColor,
            iconcolor: Colors.grey,
          ),
        ]),
      ),
    );
  }
}
