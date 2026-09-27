import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final ShadThemeData lightTheme = ShadThemeData(
  brightness: Brightness.light,
  colorScheme: const ShadColorScheme(
    background: Color(0xFFF8F7FF),
    foreground: Colors.black,
    card: Colors.white,
    cardForeground: Colors.black,
    popover: Colors.white,
    popoverForeground: Colors.black,
    primary: Colors.black,
    primaryForeground: Colors.white,
    secondary: Color(0xFFF4F4F5),
    secondaryForeground: Colors.black,
    muted: Color(0xFFF4F4F5),
    mutedForeground: Color(0xFF71717A),
    accent: Color(0xFFF4F4F5),
    accentForeground: Colors.black,
    destructive: Color(0xFFEF4444),
    destructiveForeground: Colors.white,
    border: Color(0xFFE4E4E7),
    input: Color(0xFFE4E4E7),
    ring: Colors.black,
    selection: Colors.black12,
  ),
  radius: BorderRadius.circular(8),
  // Optional: plug in a grotesque/bold display font like the screenshot
  textTheme: ShadTextTheme(family: 'Verdana'),
);

final ShadThemeData darkTheme = ShadThemeData(
  brightness: Brightness.dark,
  colorScheme: const ShadColorScheme(
    background: Color(0xFF0B0A14),
    foreground: Colors.white,
    card: Color(0xFF171426),
    cardForeground: Colors.white,
    popover: Color(0xFF171426),
    popoverForeground: Colors.white,
    primary: Colors.white,
    primaryForeground: Colors.black,
    secondary: Color(0xFF272238),
    secondaryForeground: Colors.white,
    muted: Color(0xFF272238),
    mutedForeground: Color(0xFFA1A1AA),
    accent: Color(0xFF272238),
    accentForeground: Colors.white,
    destructive: Color(0xFFEF4444),
    destructiveForeground: Colors.white,
    border: Color(0xFF3F3654),
    input: Color(0xFF3F3654),
    ring: Colors.white,
    selection: Colors.white24,
  ),
  radius: BorderRadius.circular(12),
  textTheme: ShadTextTheme(family: 'Verdana'),
);

class ThemeController extends ChangeNotifier {
  ThemeMode mode = ThemeMode.dark;

  void toggle() {
    mode = mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class ThemeScope extends InheritedWidget {
  const ThemeScope({required this.controller, required super.child, super.key});

  final ThemeController controller;

  static ThemeController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(scope != null, 'ThemeScope is missing above this context.');
    return scope!.controller;
  }

  @override
  bool updateShouldNotify(ThemeScope oldWidget) =>
      controller != oldWidget.controller;
}
