import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/view/widgets/custom_container.dart';
import 'package:task_management_app_thiran_tech/view/widgets/daily_task_custom_widget.dart';

import 'dashboard_design.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the UI for the project page.
    // This method should return a widget that represents the project page content.

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage("assets/people/image1.jpg")),
                IconButton(
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  'Hello',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ).animate().fade(delay: 300.ms),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text('Alex Marconi', style: headLineText)
                    .animate()
                    .slideX(curve: Curves.easeIn, delay: 1000.ms),
              ],
            ),

            SizedBox(
              height: 300,
              child: GridView.count(
                primary: false,
                physics: const NeverScrollableScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                childAspectRatio: 1.6,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                children: const <Widget>[
                  CustomContainerSquareBox(
                      icon: Icons.update_rounded,
                      text: "In Progress",
                      containerColor: orangeColor),
                  CustomContainerSquareBox(
                      icon: Icons.cached_outlined,
                      text: "Ongoing",
                      containerColor: purpleColor),
                  CustomContainerSquareBox(
                      icon: Icons.assignment_turned_in,
                      text: "Completed",
                      containerColor: greenColor),
                  CustomContainerSquareBox(
                      icon: Icons.description_outlined,
                      text: "Cancel",
                      containerColor: redColor),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Daily Task",
                  style: titleText,
                ),
                Row(
                  children: [
                    Text(
                      "All Task",
                      style: secondaryText,
                    ),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
            //daily task values are passed to a custom widget with parameters in order simplify the code
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Daily_task_custom_widget(
                text: "App Animation",
                progress: 0.7,
                progressBarColor: purpleColor,
                iconcolor: Colors.grey,
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Daily_task_custom_widget(
                text: "Dashboard Design",
                progress: 1,
                progressBarColor: greenColor,
                iconcolor: Colors.green,
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const DashBoardDesign()));
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Daily_task_custom_widget(
                text: "UI/UX Design",
                progress: 0.4,
                progressBarColor: orangeColor,
                iconcolor: Colors.grey,
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Daily_task_custom_widget(
                text: "Interaction Design",
                progress: 0.2,
                progressBarColor: redColor,
                iconcolor: Colors.grey,
                onTap: () {},
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
