#Task Management App - README

#Introduction
The Task Management App is a mobile application built using the Flutter framework to help users organize and manage their tasks efficiently. The app provides a user-friendly interface to create, track, and manage tasks and projects effectively. It allows users to set deadlines, track progress, and collaborate with team members.

#Features

Create and manage tasks: Users can create tasks, set deadlines, and categorize them for better organization.
Project progress tracking: The app provides a visual representation of the project's progress using a curved chart.
Team collaboration: Users can add team members to projects and view their avatars for better collaboration.
Daily task overview: The app presents a daily task overview with progress bars to track completed tasks.
Customization: Users can customize the app by choosing project colors and other preferences.


#Getting Started

Clone the repository from GitHub: https://github.com/nikhilmkda/Task-Management_app.git
Make sure you have Flutter installed on your machine. If not, follow the Flutter installation guide: https://flutter.dev/docs/get-started/install
Open the project in your favorite IDE (e.g., Android Studio, Visual Studio Code).
Run flutter pub get in the terminal to fetch the required dependencies.
Connect your device or start an emulator.
Run flutter run to launch the app on your device/emulator.

#Dependencies

The app uses the following dependencies:

flutter_animate: Provides animation capabilities for UI elements.
percent_indicator: Displays circular percent indicators to show task progress.
provider: Implements the provider design pattern for state management.
#Directory Structure

The project follows the standard Flutter directory structure:



task_management_app/
|-- lib/
|   |-- main.dart
|   |-- controllers/
|   |   |-- parameters.dart
|   |   |-- task_manage_provider.dart
|   |-- models/
|   |   |-- custom_checkbox.dart
|   |   |-- fl_chart.dart
|   |-- views/
|   |   |-- dashboard_design.dart
|   |   |-- all_project_tile.dart
|   |   |-- custom_container_square_box.dart
|   |   |-- daily_task_custom_widget.dart
|   |-- widgets/
|   |   |-- custom_checkbox.dart
|   |   |-- curved_chart_painter.dart
|   |   |-- my_curved_chart.dart
|-- assets/
|   |-- people/
|   |   |-- image1.jpg
|   |   |-- image2.jpeg
|   |   |-- image3.jpg
|   |   |-- image4.jpg
|   |   |-- image5.jpeg
|-- android/
|-- ios/
|-- test/
|-- pubspec.yaml
|-- README.md

#Contributing

Contributions to the Task Management App are welcome! If you find a bug or have an enhancement idea, please submit an issue. Pull requests with bug fixes or new features are also encouraged.
