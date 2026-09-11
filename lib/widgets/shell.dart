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
      body: child,
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