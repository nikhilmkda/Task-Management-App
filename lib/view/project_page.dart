import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/view/all_project.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  var tabTextIndexSelected = 1;
  final listTextTabToggle = ["All", "Ongoing", "Completed"];
  final List<Widget> pages = [const AllProjects()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const  CircleAvatar(
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
         const   SizedBox(
              height: 15,
            ),
        const    Row(
              children: [
                Text(
                  "Project",
                  style: titleText,
                ),
              ],
            ),
        const    SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: FlutterToggleTab(
                borderRadius: 25,
                height: 50,
                selectedIndex: tabTextIndexSelected,
                unSelectedBackgroundColors: const [
                  Colors.white,
                  Colors.white,
                ],
                selectedBackgroundColors: const [purpleColor],
                selectedTextStyle: const TextStyle(
                  color: Colors.white, // Set the selected text color to white
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                unSelectedTextStyle: titleTextSmall,
                labels: listTextTabToggle,
                selectedLabelIndex: (index) {
                  setState(() {
                    tabTextIndexSelected = index;
                  });
                },
                isScroll: false,
              ),
            ),
        const    SizedBox(
              height: 15, // Adjust this height as needed
            ),
            Expanded(
              child: pages[0], // Initially show the first page
            ),
          ],
        ),
      ),
    );
  }
}
