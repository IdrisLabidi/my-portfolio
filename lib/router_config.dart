import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/pages/HomeScreen.dart';
import 'package:my_portfolio/widgets/shell.dart';

final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('404 - Page Not Found'),
    ),
  ),
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Shell(
          currentPath: state.uri.path,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Homescreen(),
        ),
        GoRoute(
          path: '/about-me',
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const Placeholder(),
        ),
        GoRoute(
          path: '/all-projects',
          builder: (context, state) => const Placeholder(),
        ),
      ],
    ),
  ],
);