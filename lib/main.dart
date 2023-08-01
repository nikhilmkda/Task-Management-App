import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/view/homepage.dart';
import 'package:task_management_app_thiran_tech/view/project_page.dart';
import 'controller/task_manage_provider.dart';

void main() {
  runApp(const MyApp());
}

/// The main application widget that sets up the app and provides the root widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // Use MultiProvider to provide the TaskManageProvider to the entire app.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskManageProvider()),
      ],
      // MaterialApp is the root widget of the app.
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // The app starts with the home page as its initial route.
        home: Consumer<TaskManageProvider>(
          builder: (context, provider, _) {
            // The Scaffold is the main visual structure of the app.
            return Scaffold(
              backgroundColor: backgroundColor,
              // The FloatingActionButton is used for adding new items.
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                backgroundColor: purpleColor,
                onPressed: () {
                  // Define what happens when the FloatingActionButton is pressed.
                  // For this example, it does nothing.
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
              // The BottomAppBar holds the navigation buttons at the bottom of the screen.
              bottomNavigationBar: BottomAppBar(
                height: 60,
                shape: const CircularNotchedRectangle(),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Home button
                      IconButton(
                        icon: Icon(
                          Icons.home_filled,
                          color: provider.selectedIndex == 0
                              ? purpleColor
                              : Colors.grey,
                        ),
                        onPressed: () {
                          // When the home button is pressed, change the selected index to 0.
                          provider.onItemTapped(0);
                        },
                      ),
                      // Project button
                      IconButton(
                        icon: Icon(
                          Icons.insert_drive_file,
                          color: provider.selectedIndex == 1
                              ? purpleColor
                              : Colors.grey,
                        ),
                        onPressed: () {
                          // When the project button is pressed, change the selected index to 1.
                          provider.onItemTapped(1);
                        },
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      // Mail button
                      IconButton(
                        icon: Icon(
                          Icons.mail,
                          color: provider.selectedIndex == 2
                              ? purpleColor
                              : Colors.grey,
                        ),
                        onPressed: () {
                          // When the mail button is pressed, change the selected index to 2.
                          provider.onItemTapped(2);
                        },
                      ),
                      // Settings button
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: provider.selectedIndex == 3
                              ? purpleColor
                              : Colors.grey,
                        ),
                        onPressed: () {
                          // When the settings button is pressed, change the selected index to 3.
                          provider.onItemTapped(3);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // The body of the app is based on the selected index.
              body: _buildPage(provider.selectedIndex),
            );
          },
        ),
      ),
    );
  }

  /// Helper method to return the appropriate page based on the selected index.
  /// [selectedIndex] is the index of the current page to display.
  Widget _buildPage(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        // Return the home page.
        return const MyHomePage();
      case 1:
        // Return the project page.
        return const ProjectPage();
      default:
        // If the selected index is not recognized, return the home page by default.
        return const MyHomePage();
    }
  }
}
