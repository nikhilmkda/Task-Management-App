import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/view/all_project_tile.dart';

import 'dashboard_design.dart';

class AllProjects extends StatelessWidget {
  const AllProjects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AllProjectTile(
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
          title: "Dashboard Design",
          date: "Today, Shared by - Ui Been",
          percentageNum: 0.85,
          percentage: "85%",
          secondDate: 'July 25, 2021 - July 30, 2021',
          percentageColor: greenColor,
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: const DashBoardDesign()));
          },
        ),
     const   SizedBox(
          height: 22,
        ),
        AllProjectTile(
          title: "UI/UX Design",
          date: "Today, Shared by - Unbox",
          percentageNum: 0.30,
          percentage: "30%",
          secondDate: 'July 25, 2021 - July 30, 2021',
          percentageColor: orangeColor,
          onTap: () {},
        ),
    const    SizedBox(
          height: 22,
        ),
        AllProjectTile(
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
