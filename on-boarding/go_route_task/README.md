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
   cd 2023-project-phase-mobile-tasks/on-boarding/go_route_task

   ```

3. **Install Dependencies**:

   ```bash
   flutter pub get
   ```

4. **Run the App**:
   ```bash
   flutter run
   ```

## Demo Video

[<img src="https://www.pngmart.com/files/1/Video-Icon-PNG-File.png" width="150" height="150" />](https://www.loom.com/share/21f9794107bd4b27a7d4b6611659b92d?sid=c84ba482-a8fb-49ed-8023-f57d2a79b65f)

## Additional Information for Reviewers

- **Dependencies**:

  - This app utilizes the `go_router` package for routing and navigation. Make sure to check the `pubspec.yaml` file for the version and additional dependencies.

- **Configuration**:

  - Routing and screen transitions are defined in `lib/routes.dart`, where named routes and navigation animations are configured.

- **Screens**:
  - **Home Screen** (`lib/screens/home_screen.dart`): Displays tasks and provides navigation to add/edit tasks.
  - **Add Task Screen** (`lib/screens/add_task_screen.dart`): Form for adding new tasks.
  - **View Edit Task Screen** (`lib/screens/view_edit_screen.dart`): Form for editing existing tasks.

Feel free to explore the `go_router` setup and how it integrates with the app’s navigation flow.

## Architecture

The project uses **Clean Architecture**, which is divided into three primary layers:

1. **Presentation Layer**

   - Responsible for the UI and managing user interactions.
   - Consists of screens such as `HomeScreen`, `AddTaskScreen`, and `ViewEditTaskScreen`.
   - Utilizes Flutter's widget system to build the user interface, including handling user events and navigation.

2. **Domain Layer**

   - Contains the business logic and core functionality.
   - This layer defines essential entities like `Todo`, and use cases that interact with the data layer.

3. **Data Layer**
   - Manages data fetching, storage, and conversion between models and JSON.
   - Defines the `TodoModel` class, which mirrors the `Todo` entity and includes methods like `fromJson` and `toJson` for JSON conversion.

## Data Flow

The application follows a clear and structured data flow:

1. **User Interaction**: The user performs actions (e.g., creating or editing a task).
2. **UI Event Handling**: The **Presentation Layer** captures these events and delegates them to the relevant use cases in the **Domain Layer**.
3. **Data Processing**: The **Data Layer** manages data, whether it’s stored locally or retrieved via an API, and transforms it into Dart models like `TodoModel`.
4. **State and UI Update**: Processed data is sent back to the **Presentation Layer**, updating the UI based on new data or user actions.

## Features

- **Task Creation**: Users can create new tasks with details such as title, type, due date, and description.
- **Task Management**: Users can view and edit tasks, as well as mark tasks as completed.
- **Smooth Transitions**: Custom page transitions with scale and fade animations are implemented for navigation between screens.
- **JSON Conversion**: Tasks are stored as JSON objects, and conversion between JSON and Dart objects is handled using the `TodoModel`.

## Contribution

Contributions are welcome!

## Acknowledgements

- [go_router](https://pub.dev/packages/go_router) for efficient and manageable routing.
- [Flutter](https://flutter.dev/) for the development framework.
