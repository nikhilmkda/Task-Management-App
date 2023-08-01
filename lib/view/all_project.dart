import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/model/all_project_tile.dart';

import 'dashboard_design.dart';

class AllProjects extends StatelessWidget {
  const AllProjects({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The list of projects is displayed as a ListView of custom AllProjectTile widgets.
    return ListView(
      children: [
        AllProjectTile(
          // First project tile.
          title: "App Animation",
          date: "Today, Shared by - Unbox Digital",
          percentageNum: 0.65,
          percentage: "65%",
          secondDate: 'June 15, 2021 - June 22, 2021',
          percentageColor: purpleColor,
          onTap: () {},
        ),
        const SizedBox(
          height: 22,
        ),
        AllProjectTile(
          // Second project tile.
          title: "Dashboard Design",
          date: "Today, Shared by - Ui Been",
          percentageNum: 0.85,
          percentage: "85%",
          secondDate: 'July 25, 2021 - July 30, 2021',
          percentageColor: greenColor,
          onTap: () {
            // When the second project tile is tapped, navigate to the DashBoardDesign page using page transition animation.
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                child: const DashBoardDesign(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 22,
        ),
        AllProjectTile(
          // Third project tile.
          title: "UI/UX Design",
          date: "Today, Shared by - Unbox",
          percentageNum: 0.30,
          percentage: "30%",
          secondDate: 'July 25, 2021 - July 30, 2021',
          percentageColor: orangeColor,
          onTap: () {},
        ),
        const SizedBox(
          height: 22,
        ),
        AllProjectTile(
          // Fourth project tile.
          title: "App Animation",
          date: "Today, Shared by - Unbox Digital",
          percentageNum: 0.65,
          percentage: "65%",
          secondDate: 'June 15, 2021 - June 22, 2021',
          percentageColor: purpleColor,
          onTap: () {},
        ),
      ],
    );
  }
}
