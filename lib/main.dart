import 'package:flutter/material.dart';
import 'package:my_portfolio/router_config.dart';
import 'package:my_portfolio/theme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _themeController = ThemeController();

  @override
  void dispose() {
    _themeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeController,
      builder: (context, child) {
        return ThemeScope(
          controller: _themeController,
          child: ShadApp.router(
            title: 'Idris Labidi - Portfolio',
            debugShowCheckedModeBanner: false,
            themeMode: _themeController.mode,
            theme: lightTheme,
            darkTheme: darkTheme,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
