import 'dart:math' as math;

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 104, 24, 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 950),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _IntroCard(),
              const SizedBox(height: 72),
              const _SectionLabel(
                icon: Icons.school_rounded,
                title: 'Education',
                subtitle: 'The foundations behind how I build and think.',
              ),
              const SizedBox(height: 22),
              const _Reveal(
                delay: Duration(milliseconds: 180),
                child: _EducationTimeline(),
              ),
              const SizedBox(height: 70),
              const _SectionLabel(
                icon: Icons.rocket_launch_rounded,
                title: 'Internships & experience',
                subtitle: 'Turning ideas into useful products with real teams.',
              ),
              const SizedBox(height: 22),
              const _Reveal(
                delay: Duration(milliseconds: 280),
                child: _ExperienceCard(
                period: 'February 2025 – June 2025',
                role: 'PFE Intern · Full-Stack Developer',
                company: 'NEXT STEP IT',
                description:
                    'Developed a complete web application from backend to frontend. Contributed to API design, database management, and business features across the full delivery cycle.',
                tags: [
                  'Backend APIs',
                  'Frontend development',
                  'Databases',
                  'Business features',
                ],
                ),
              ),
              const SizedBox(height: 18),
              const _Reveal(
                delay: Duration(milliseconds: 360),
                child: _ExperienceCard(
                period: 'July 2024 – September 2024',
                role: 'Summer Intern · Frontend Angular Developer',
                company: 'MaibornWolff GmbH',
                description:
                    'Designed and developed dynamic user interfaces with Angular, translating requirements into clear frontend experiences and improving usability through responsive, maintainable UI work.',
                tags: [
                  'Angular',
                  'Dynamic interfaces',
                  'UI/UX',
                  'Responsive design',
                ],
                ),
              ),
              const SizedBox(height: 70),
              const _SectionLabel(
                icon: Icons.auto_awesome_rounded,
                title: 'Technical skills',
                subtitle: 'A toolkit that keeps growing with every project.',
              ),
              const SizedBox(height: 22),
              const _Reveal(
                delay: Duration(milliseconds: 440),
                child: _SkillsGrid(),
              ),
              const SizedBox(height: 70),
              const _SectionLabel(
                icon: Icons.explore_rounded,
                title: 'Interests',
                subtitle: 'Curious about the systems and experiences behind the screen.',
              ),
              const SizedBox(height: 22),
              const _Reveal(
                delay: Duration(milliseconds: 520),
                child: _AboutCard(
                body:
                    'Artificial intelligence, UX design, web development, cloud computing, DevOps, application security, microservices, and distributed systems.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.62),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IntroCard extends StatelessWidget {
  const _IntroCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return _Reveal(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? const [Color(0xFF302052), Color(0xFF171426)]
                : const [Color(0xFFEDE9FE), Color(0xFFFFFFFF)],
          ),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.18),
          ),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.12),
              blurRadius: 30,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person_rounded,
                color: theme.colorScheme.onPrimary,
                size: 30,
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About me',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'I am Idris Labidi, a software engineering student at the Faculty of Sciences of Tunis, University of Tunis El Manar.',
                    style: theme.textTheme.titleMedium?.copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      _IntroBadge(
                        icon: Icons.code_rounded,
                        label: 'Software engineering',
                      ),
                      _IntroBadge(
                        icon: Icons.location_on_rounded,
                        label: 'Tunis, Tunisia',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroBadge extends StatelessWidget {
  const _IntroBadge({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      avatar: Icon(icon, size: 16, color: theme.colorScheme.primary),
      label: Text(label),
      visualDensity: VisualDensity.compact,
      side: BorderSide.none,
      backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.7),
    );
  }
}

class _Reveal extends StatefulWidget {
  const _Reveal({required this.child, this.delay = Duration.zero});

  final Widget child;
  final Duration delay;

  @override
  State<_Reveal> createState() => _RevealState();
}

class _RevealState extends State<_Reveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.08),
          end: Offset.zero,
        ).animate(animation),
        child: widget.child,
      ),
    );
  }
}

class _EducationTimeline extends StatelessWidget {
  const _EducationTimeline();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _EducationItem(
          period: 'September 2025 – Present',
          degree: 'Engineering Degree in Software Engineering',
          institution: 'Faculty of Sciences of Tunis',
          university: 'University of Tunis El Manar',
          detail:
              'Engineering cycle focused on advanced software engineering, architecture, distributed systems, and scalable applications.',
          isCurrent: true,
        ),
        _EducationItem(
          period: 'September 2022 – June 2025',
          degree:
              'Licence in Software Engineering and Information Systems (GLSI)',
          institution: 'Faculty of Sciences of Tunis',
          university: 'University of Tunis El Manar',
          detail:
              'Completed with Très bien honours, building foundations in software development, information systems, databases, and application design.',
        ),
        _EducationItem(
          period: '2021 – 2022',
          degree: 'Scientific Baccalaureate · Mathematics',
          institution: 'Lycée Carthage Byrsa',
          university: 'Carthage',
          detail: 'Completed with Bien honours.',
          isLast: true,
        ),
      ],
    );
  }
}

class _EducationItem extends StatelessWidget {
  const _EducationItem({
    required this.period,
    required this.degree,
    required this.institution,
    required this.university,
    required this.detail,
    this.isCurrent = false,
    this.isLast = false,
  });

  final String period;
  final String degree;
  final String institution;
  final String university;
  final String detail;
  final bool isCurrent;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.primary;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 34,
            child: Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isCurrent ? accent : theme.colorScheme.surface,
                    shape: BoxShape.circle,
                    border: Border.all(color: accent, width: 3),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: accent.withOpacity(0.35)),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.72),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant.withOpacity(0.7),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    period,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: accent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    degree,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _UniversityLogoPlaceholder(),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              institution,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              university,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.72,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    detail,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      height: 1.55,
                      color: theme.colorScheme.onSurface.withOpacity(0.76),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UniversityLogoPlaceholder extends StatelessWidget {
  const _UniversityLogoPlaceholder();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
      ),
      child: Icon(
        Icons.school_rounded,
        color: theme.colorScheme.primary,
        size: 26,
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({
    required this.period,
    required this.role,
    required this.company,
    required this.description,
    required this.tags,
  });

  final String period;
  final String role;
  final String company;
  final String description;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.72),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.7),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            period,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            role,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            company,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: theme.textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: theme.colorScheme.onSurface.withOpacity(0.76),
            ),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags
                .map(
                  (tag) => Chip(
                    label: Text(tag),
                    visualDensity: VisualDensity.compact,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  const _SkillsGrid();

  static const skills = [
    _Skill('C', 'c', '5B8DEF'),
    _Skill('Dart', 'dart', '2D9CDB'),
    _Skill('Java', 'java', 'E58A27'),
    _Skill('Python', 'python', '4B8BBE'),
    _Skill('JavaScript', 'javascript', 'F0C929'),
    _Skill('TypeScript', 'typescript', '3178C6'),
    _Skill('HTML5', 'html5', 'E34F26'),
    _Skill('CSS3', 'css3', '1572B6'),
    _Skill('Sass', 'sass', 'CC6699'),
    _Skill('Tailwind CSS', 'tailwind', '06B6D4'),
    _Skill('Angular', 'angular', 'DD0031'),
    _Skill('Flutter', 'flutter', '42A5F5'),
    _Skill('React', 'react', '61DAFB'),
    _Skill('Redux', 'redux', '764ABC'),
    _Skill('Next.js', 'next', '8D8D9B'),
    _Skill('Three.js', 'three', 'B6A3FF'),
    _Skill('RxJS', 'rxjs', 'B7178C'),
    _Skill('Node.js', 'node', '5FA04E'),
    _Skill('Express.js', 'express', '9BA3B4'),
    _Skill('JWT', 'jwt', 'FFB74D'),
    _Skill('NPM', 'npm', 'CB3837'),
    _Skill('MongoDB', 'mongo', '47A248'),
    _Skill('Microsoft SQL Server', 'sql', 'CC2927'),
    _Skill('MySQL', 'mysql', '5AA5D8'),
    _Skill('Firebase', 'firebase', 'FFCA28'),
    _Skill('Figma', 'figma', 'F24E1E'),
    _Skill('Canva', 'canva', '00C4CC'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 12,
      children: [
        for (var index = 0; index < skills.length; index++)
          _SkillCard(skill: skills[index], index: index),
      ],
    );
  }
}

class _Skill {
  const _Skill(this.name, this.slug, this.color);

  final String name;
  final String slug;
  final String color;
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.skill, required this.index});

  static const _icons = {
    'c': IconData(0xe639, fontFamily: 'DevIcons', fontPackage: 'dev_icons'),
    'dart': IconData(0xe9b1, fontFamily: 'DevIcons', fontPackage: 'dev_icons'),
    'java': IconData(0xe842, fontFamily: 'DevIcons', fontPackage: 'dev_icons'),
    'python': IconData(
      0xeb89,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'javascript': IconData(
      0xe845,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'typescript': IconData(
      0xe920,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'html5': IconData(
      0xe7f7,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'css3': IconData(
      0xe679,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'sass': IconData(
      0xebcb,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'tailwind': IconData(
      0xe9df,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'angular': IconData(
      0xe61d,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'flutter': IconData(
      0xe975,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'react': IconData(
      0xe601,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'redux': IconData(
      0xe964,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'next': IconData(
      0xe9a5,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'node': IconData(
      0xeb6a,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'express': IconData(
      0xe93d,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'npm': IconData(
      0xe952,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'mongo': IconData(
      0xeb44,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'sql': IconData(
      0xe97e,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'mysql': IconData(
      0xeb61,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'firebase': IconData(
      0xe98a,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
    'figma': IconData(
      0xe9ac,
      fontFamily: 'DevIcons',
      fontPackage: 'dev_icons',
    ),
  };
  static const _fallbackIcon = IconData(
    0xe93b,
    fontFamily: 'DevIcons',
    fontPackage: 'dev_icons',
  );

  final _Skill skill;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = Color(int.parse('FF${skill.color}', radix: 16));

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 1800 + (index % 5) * 180),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        final wave = math.sin(value * math.pi * 2);
        return Transform.translate(
          offset: Offset(0, wave * 4),
          child: Transform.rotate(
            angle: wave * 0.018,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 8, 14, 8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: color.withValues(alpha: 0.42)),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.12),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_iconFor(skill.slug), size: 20, color: color),
                  const SizedBox(width: 8),
                  Text(
                    skill.name,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  IconData _iconFor(String slug) => _icons[slug] ?? _fallbackIcon;
}

class _AboutCard extends StatelessWidget {
  const _AboutCard({required this.body});

  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.72),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.7),
        ),
      ),
      child: Text(
        body,
        style: theme.textTheme.bodyLarge?.copyWith(
          height: 1.6,
          color: theme.colorScheme.onSurface.withOpacity(0.76),
        ),
      ),
    );
  }
}
