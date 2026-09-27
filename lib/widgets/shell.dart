import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Shell extends StatelessWidget {
  const Shell({
    required this.child,
    required this.currentPath,
    super.key,
  });

  final Widget child;
  final String currentPath;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).width > 768;

    return Scaffold(
      appBar: isDesktop ? SiteHeader(currentPath: currentPath) : AppBar(),
      // Mobile Navigation Drawer
      drawer: isDesktop
          ? null
          : Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            ListTile(
              title: const Text("Home"),
              selected: currentPath == '/',
              onTap: () {
                Navigator.pop(context);
                context.go('/');
              },
            ),
            ListTile(
              title: const Text("Projects"),
              selected: currentPath == '/all-projects',
              onTap: () {
                Navigator.pop(context);
                context.go('/all-projects');
              },
            ),
            ListTile(
              title: const Text("About"),
              selected: currentPath == '/about-me',
              onTap: () {
                Navigator.pop(context);
                context.go('/about-me');
              },
            ),
            ListTile(
              title: const Text("Contact"),
              selected: currentPath == '/contact',
              onTap: () {
                Navigator.pop(context);
                context.go('/contact');
              },
            ),
          ],
        ),
      ),
      body: AppBackground(
             isDark: Theme.of(context).brightness == Brightness.dark,
             child: child,
           ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.label,
    required this.path,
    required this.currentPath,
  });

  final String label;
  final String path;
  final String currentPath;

  @override
  Widget build(BuildContext context) {
    final isActive = currentPath == path;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ShadButton.ghost(
        onPressed: () => context.go(path),
        decoration: ShadDecoration(
          border: isActive
              ? const ShadBorder(
            bottom: ShadBorderSide(width: 2, color: Colors.grey),
          )
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class SiteHeader extends StatelessWidget implements PreferredSizeWidget {
  const SiteHeader({required this.currentPath, super.key});

  final String currentPath;

  static const _items = {
    'Home': '/',
    'About me': '/about-me',
    'Contact': '/contact',
    'All projects': '/all-projects',
  };

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _items.entries.map((e) {
            return _NavItem(
              label: e.key,
              isActive: currentPath == e.value,
              onTap: () => context.go(e.value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final highlighted = widget.isActive || _hovering;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: highlighted ? const Color(0xFFF4F4F5) : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({required this.currentPath, super.key});

  final String currentPath;

  static const _items = {
    'Home': '/',
    'About me': '/about-me',
    'Contact': '/contact',
    'All projects': '/all-projects',
  };

  @override
  Widget build(BuildContext context) {
    return const ShadMenubar(
        items: [
        ]
    );
  }
}


/// Recreates the pszostak.pl hero background:
/// diagonal gradient wash + two blurred glow orbs + a subtle dot grid.
///
/// Usage:
///   Scaffold(
///     body: AppBackground(
///       isDark: Theme.of(context).brightness == Brightness.dark,
///       child: YourPageContent(),
///     ),
///   )
class AppBackground extends StatelessWidget {
  final Widget child;
  final bool isDark;

  const AppBackground({super.key, required this.child, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Base diagonal gradient
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? const [Color(0xFF1A1130), Color(0xFF0B0A14)]
                    : const [Color(0xFFEDE9FE), Color(0xFFFFFFFF)],
              ),
            ),
          ),
        ),

        // 2. Blurred glow orbs (clipped so the blur doesn't bleed off-screen oddly)
        Positioned.fill(
          child: ClipRect(
            child: Stack(
              children: [
                Positioned(
                  top: -120,
                  left: -120,
                  child: _GlowOrb(
                    color: isDark ? const Color(0xFF6D28D9) : const Color(0xFFA78BFA),
                    size: 420,
                    opacity: isDark ? 0.30 : 0.45,
                  ),
                ),
                Positioned(
                  bottom: -180,
                  right: -180,
                  child: _GlowOrb(
                    color: isDark ? const Color(0xFFBE185D) : const Color(0xFFF9A8D4),
                    size: 520,
                    opacity: isDark ? 0.25 : 0.50,
                  ),
                ),
              ],
            ),
          ),
        ),

        // 3. Dot grid overlay
        Positioned.fill(
          child: CustomPaint(
            painter: _DotGridPainter(
              dotColor: (isDark ? Colors.white : Colors.black)
                  .withOpacity(isDark ? 0.07 : 0.09),
              spacing: 28,
              radius: 1.2,
            ),
          ),
        ),

        // 4. Actual page content on top
        child,
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final Color color;
  final double size;
  final double opacity;

  const _GlowOrb({
    required this.color,
    required this.size,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(opacity),
        ),
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  final Color dotColor;
  final double spacing;
  final double radius;

  _DotGridPainter({
    required this.dotColor,
    required this.spacing,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = dotColor;
    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter oldDelegate) {
    return oldDelegate.dotColor != dotColor ||
        oldDelegate.spacing != spacing ||
        oldDelegate.radius != radius;
  }
}
