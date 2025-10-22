import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/common/bottom_tab_shell_layout.dart';
import 'package:weather_app/features/filters_screen/presentation/filters_screen.dart';
import 'package:weather_app/features/home_screen/presentation/home_screen.dart';
import 'package:weather_app/route/app_router_name.dart';

GoRouter appRoutes = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return BottomTabShellLayout(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRouterName.home,
          builder: (BuildContext context, GoRouterState state) => HomeScreen(),
        ),
        GoRoute(
          path: AppRouterName.filters,
          builder: (BuildContext context, GoRouterState state) {
            return FiltersScreen();
          },
        ),
      ],
    ),
  ],
);
