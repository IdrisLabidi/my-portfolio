import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 104, 24, 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 950),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About me',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'I am Idris Labidi, a software engineering student at the Faculty of Sciences of Tunis, University of Tunis El Manar.',
                style: theme.textTheme.titleLarge?.copyWith(height: 1.5),
              ),
              const SizedBox(height: 32),
              const _SectionLabel(title: 'Education'),
              const SizedBox(height: 14),
              const _EducationTimeline(),
              const SizedBox(height: 30),
              const _SectionLabel(title: 'Internships & experience'),
              const SizedBox(height: 14),
              const _ExperienceCard(
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
              const SizedBox(height: 16),
              const _ExperienceCard(
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
              const SizedBox(height: 30),
              const _SectionLabel(title: 'Interests'),
              const SizedBox(height: 14),
              const _AboutCard(
                body:
                    'Artificial intelligence, UX design, web development, cloud computing, DevOps, application security, microservices, and distributed systems.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
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
