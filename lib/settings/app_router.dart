import 'package:any_questions/pages/my_courses/classes_page.dart';
import 'package:any_questions/pages/my_courses/summary_page.dart';
import 'package:any_questions/pages/statistics/statistics_list_page.dart';
import 'package:any_questions/pages/statistics/statistics_types/questions_asked_stats.dart';
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
              groupID: state.queryParams["groupID"],
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
        GoRoute(
            path: 'home_screen/statistics_list_page',
            name: 'statistics_list',
            builder: (BuildContext context, GoRouterState state) {
              return StatisticsListPage(
                groupID: state.queryParams["groupID"],
              );
            },
            routes: [
              GoRoute(
                path: 'home_screen/statistics_list_page/questions_asked_stats',
                name: 'questions_asked',
                builder: (BuildContext context, GoRouterState state) {
                  return QuestionsAskedStats(
                    groupID: state.queryParams["groupID"],
                  );
                },
              ),
            ]
        ),
      ]
  ),
]);
