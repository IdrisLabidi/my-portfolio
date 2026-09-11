import 'package:go_router/go_router.dart';
import 'package:my_portfolio/pages/HomeScreen.dart';
import 'package:my_portfolio/widgets/shell.dart';

final router = GoRouter(routes: [
  ShellRoute(
    builder: (context, state, child) => Shell(child: child),
      routes: [
        GoRoute(path: '/', builder: (context, state) => Homescreen())
      ]
  )
]);