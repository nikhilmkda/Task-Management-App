import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/view/all_project.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

/// The state for the [ProjectPage] widget.
/// This class handles the logic and state management for the ProjectPage.
class _ProjectPageState extends State<ProjectPage> {
  // Track the index of the currently selected tab.
  var tabTextIndexSelected = 0; // Default selected index is 0 (All Projects).

  // List of labels for the toggle tabs.
  final listTextTabToggle = ["All", "Ongoing", "Completed"];
  
  // List of pages to be displayed in each tab.
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
                // Display the user's profile image as a CircleAvatar.
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/people/image1.jpg"),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 35,
                  ),
                  onPressed: () {
                    // TODO: Implement the search functionality when the search icon is pressed.
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // Display the section title for the projects.
            const Row(
              children: [
                Text(
                  "Project",
                  style: titleText,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // Create a toggle tab bar to switch between different project lists.
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
                  color: Colors.white, 
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                unSelectedTextStyle: titleTextSmall,
                labels: listTextTabToggle,
                selectedLabelIndex: (index) {
                  // Update the selected index when a tab is tapped.
                  setState(() {
                    tabTextIndexSelected = index;
                  });
                },
                isScroll: false,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Display the content of the selected page based on the selected tab index.
            Expanded(
              child: pages[tabTextIndexSelected],
            ),
          ],
        ),
      ),
    );
  }
}
