import 'package:flutter/material.dart';
import 'package:my_portfolio/router_config.dart';
import 'package:my_portfolio/theme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.router(
      title: 'Idris Labidi - Portfolio',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: appTheme,
      routerConfig: router,
    );
  }
}
