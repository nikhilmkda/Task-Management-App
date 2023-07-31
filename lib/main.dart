import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app_thiran_tech/controller/parameters.dart';
import 'package:task_management_app_thiran_tech/view/homepage.dart';
import 'package:task_management_app_thiran_tech/view/project_page.dart';

import 'controller/task_manage_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskManageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<TaskManageProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              backgroundColor: backgroundColor,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                backgroundColor: purpleColor,
                onPressed: () {},
                child: Icon(
                  Icons.add,
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                height: 60,
                shape: CircularNotchedRectangle(),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home_filled,
                          color: provider.selectedIndex == 0
                              ? purpleColor
                              : Colors.grey,
                        ),
                        onPressed: () {
                          provider.onItemTapped(0);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.insert_drive_file,
                          color: provider.selectedIndex == 1
                              ? purpleColor
                              : Colors.grey,
                        ),
                        onPressed: () {
                          provider.onItemTapped(1);
                        },
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.mail,
                          color: provider.selectedIndex == 2
                              ? purpleColor
                              : Colors.grey,
                        ),
                        onPressed: () {
                          provider.onItemTapped(2);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: provider.selectedIndex == 3
                              ? purpleColor
                              : Colors.grey,
                        ),
                        onPressed: () {
                          provider.onItemTapped(3);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              body: _buildPage(provider.selectedIndex),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPage(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const MyHomePage();
      case 1:
        return const ProjectPage();

      default:
        return const MyHomePage();
    }
  }
}
