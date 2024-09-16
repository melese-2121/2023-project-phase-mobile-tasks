import 'package:go_router/go_router.dart';
import 'package:go_route_task/screens/add_task_screen.dart';
import 'package:go_route_task/screens/home_screen.dart';
import 'package:go_route_task/screens/view_edit_task_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: "/",
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
      name: 'addTask',
      path: "/add",
      builder: (context, state) => CreateNewTaskScreen(),
    ),
    GoRoute(
        name: 'viewEditTask',
        path: "/viewEdit/:id",
        builder: (context, state) {
          return ViewEditScreen(
              id: state.pathParameters['id']
                  .toString() // Correctly access the 'id' from state.params
              );
        }),
  ],
);
