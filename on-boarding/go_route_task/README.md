# Task Management App

A Flutter application for managing tasks with smooth navigation and state management using `go_router`. This app allows users to add, view, and edit tasks, featuring named routes, data passing between screens, and custom navigation animations.

## Functionality

- **Home Screen**: Displays a list of all tasks.
- **Add Task Screen**: Provides a form to input the title and description of a new task.
- **Edit Task Screen**: Allows users to view and modify the details of an existing task.

### Navigation with `go_router`

- **Named Routes**:

  - `home`: Route for the home screen where all tasks are listed.
  - `addTask`: Route for the screen to add a new task.
  - `viewEditTask`: Route for the screen to edit an existing task.

- **Passing Data**:

  - Task data is passed between the home screen and the view and edit screen using `go_router` mechanisms.

- **Navigation Animations**:

  - Smooth transitions and animations between screens are implemented using `go_router`'s animation features.

- **Handling Navigation Events**:
  - The back navigation from the add/edit screens returns to the home screen seamlessly.

## Running the App

To run the app on your local machine, follow these steps:

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/melese-2121/2023-project-phase-mobile-tasks.git
   ```

2. **Navigate to the Project Directory**:

   ```bash
   cd 2023-project-phase-mobile-tasks
   cd on-boarding
   cd go_route_task
   ```

3. **Install Dependencies**:

   ```bash
   flutter pub get
   ```

4. **Run the App**:
   ```bash
   flutter run
   ```

## Demo

[![Watch the demo](https://www.pngmart.com/files/1/Video-Icon-PNG-File.png)](https://www.loom.com/share/21f9794107bd4b27a7d4b6611659b92d?sid=c84ba482-a8fb-49ed-8023-f57d2a79b65f)

## Additional Information for Reviewers

- **Dependencies**:

  - This app utilizes the `go_router` package for routing and navigation. Make sure to check the `pubspec.yaml` file for the version and additional dependencies.

- **Configuration**:

  - Routing and screen transitions are defined in `lib/routes.dart`, where named routes and navigation animations are configured.

- **Screens**:
  - **Home Screen** (`lib/screens/home_screen.dart`): Displays tasks and provides navigation to add/edit tasks.
  - **Add Task Screen** (`lib/screens/add_task_screen.dart`): Form for adding new tasks.
  - **View Edit Task Screen** (`lib/screens/edit_task_screen.dart`): Form for editing existing tasks.

Feel free to explore the `go_router` setup and how it integrates with the app’s navigation flow.

## Contribution

Contributions are welcome!

## Acknowledgements

- [go_router](https://pub.dev/packages/go_router) for efficient and manageable routing.
- [Flutter](https://flutter.dev/) for the development framework.
