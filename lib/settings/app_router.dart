import 'package:any_questions/pages/my_courses/classes_page.dart';
import 'package:any_questions/pages/my_courses/summary_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    name: 'login',
    builder: (BuildContext context, GoRouterState state) {
      return LoginScreen();
    },
  ),
  GoRoute(
      path: '/home_screen',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'home_screen/classes_page',
          name: 'class_lectures',
          builder: (BuildContext context, GoRouterState state) {
            return ClassesPage(
              classID: state.queryParams["classID"],
            );
          },
          routes: [
            GoRoute(
              path: 'home_screen/classes_page/summary_page',
              name: 'class_summaries',
              builder: (BuildContext context, GoRouterState state) {
                return SummaryPage(
                  lectureID: state.queryParams["lectureID"],
                );
              },
            ),
          ]
        ),
      ]
  ),
  // GoRoute(
  //   path: '/register',
  //   name: 'register',
  //   builder: (BuildContext context, GoRouterState state) {
  //     return RegisterScreen();
  //   },
  // ),
  // GoRoute(
  //   path: '/simple_register',
  //   name: 'simpleRegister',
  //   builder: (BuildContext context, GoRouterState state) {
  //     return SimpleRegisterScreen();
  //   },
  // ),
]);
