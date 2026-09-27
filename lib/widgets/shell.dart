import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/theme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Shell extends StatelessWidget {
  const Shell({required this.child, required this.currentPath, super.key});

  final Widget child;
  final String currentPath;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).width > 768;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: isDesktop
          ? SiteHeader(currentPath: currentPath)
          : const MobileHeader(),
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
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: preferredSize.height - MediaQuery.paddingOf(context).top,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _NavigationPill(currentPath: currentPath, items: _items),
            const Positioned(right: 24, child: ThemeToggleButton()),
          ],
        ),
      ),
    );
  }
}

class MobileHeader extends StatelessWidget implements PreferredSizeWidget {
  const MobileHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: ThemeToggleButton(),
        ),
      ],
    );
  }
}

class _NavigationPill extends StatelessWidget {
  const _NavigationPill({required this.currentPath, required this.items});

  final String currentPath;
  final Map<String, String> items;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: (isDark ? Colors.white : Colors.white).withValues(
          alpha: isDark ? 0.10 : 0.62,
        ),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: Colors.white.withValues(alpha: isDark ? 0.22 : 0.78),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.24 : 0.10),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.50),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: items.entries.map((entry) {
          return _NavItem(
            label: entry.key,
            isActive: currentPath == entry.value,
            onTap: () => context.go(entry.value),
          );
        }).toList(),
      ),
    );
  }
}

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = ThemeScope.of(context);
    return Tooltip(
      message: isDark ? 'Switch to light mode' : 'Switch to dark mode',
      child: Semantics(
        button: true,
        label: isDark ? 'Switch to light mode' : 'Switch to dark mode',
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (isDark ? Colors.white : Colors.white).withValues(
                alpha: isDark ? 0.13 : 0.72,
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: isDark ? 0.24 : 0.85),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.24 : 0.10),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: controller.toggle,
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  size: 19,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
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
            color: highlighted
                ? Colors.white.withValues(
                    alpha: Theme.of(context).brightness == Brightness.dark
                        ? 0.18
                        : 0.72,
                  )
                : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
              color: Theme.of(context).colorScheme.onSurface,
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

  @override
  Widget build(BuildContext context) {
    return const ShadMenubar(items: []);
  }
}

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
                    color: isDark
                        ? const Color(0xFF6D28D9)
                        : const Color(0xFFA78BFA),
                    size: 420,
                    opacity: isDark ? 0.30 : 0.45,
                  ),
                ),
                Positioned(
                  bottom: -180,
                  right: -180,
                  child: _GlowOrb(
                    color: isDark
                        ? const Color(0xFFBE185D)
                        : const Color(0xFFF9A8D4),
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
              dotColor: (isDark ? Colors.white : Colors.black).withValues(
                alpha: isDark ? 0.07 : 0.09,
              ),
              spacing: 28,
              radius: 1.2,
            ),
          ),
        ),

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
          color: color.withValues(alpha: opacity),
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
