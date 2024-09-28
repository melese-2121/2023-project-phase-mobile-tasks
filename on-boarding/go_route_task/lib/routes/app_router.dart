import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_route_task/features/todo/presentation/pages/add_task_screen.dart';
import 'package:go_route_task/features/todo/presentation/pages/home_screen.dart';
import 'package:go_route_task/features/todo/presentation/pages/view_edit_task_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MyHomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const beginScale = 0.85;
          const endScale = 1.0;

          var scaleAnimation =
              animation.drive(Tween(begin: beginScale, end: endScale));
          var opacityAnimation = animation.drive(Tween(begin: 0.0, end: 1.0));

          return ScaleTransition(
            scale: scaleAnimation,
            child: FadeTransition(
              opacity: opacityAnimation,
              child: child,
            ),
          );
        },
      ),
    ),
    GoRoute(
      name: 'addTask',
      path: '/add',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: CreateNewTaskScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const beginScale = 0.85;
          const endScale = 1.0;

          var scaleAnimation =
              animation.drive(Tween(begin: beginScale, end: endScale));
          var opacityAnimation = animation.drive(Tween(begin: 0.0, end: 1.0));

          return ScaleTransition(
            scale: scaleAnimation,
            child: FadeTransition(
              opacity: opacityAnimation,
              child: child,
            ),
          );
        },
      ),
    ),
    GoRoute(
      name: 'viewEditTask',
      path: '/viewEdit/:id',
      pageBuilder: (context, state) {
        final item = state.extra as Map<String, dynamic>;

        return CustomTransitionPage(
          key: state.pageKey,
          child: ViewEditScreen(
            id: state.pathParameters['id'].toString(),
            item: item,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const beginScale = 0.85;
            const endScale = 1.0;

            var scaleAnimation =
                animation.drive(Tween(begin: beginScale, end: endScale));
            var opacityAnimation = animation.drive(Tween(begin: 0.0, end: 1.0));

            return ScaleTransition(
              scale: scaleAnimation,
              child: FadeTransition(
                opacity: opacityAnimation,
                child: child,
              ),
            );
          },
        );
      },
    ),
  ],
);
