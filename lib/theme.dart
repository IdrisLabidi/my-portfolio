import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final ShadThemeData appTheme = ShadThemeData(
  brightness: Brightness.dark,
  colorScheme: const ShadColorScheme(
    background: Colors.white,
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