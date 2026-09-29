import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  static const projects = [
    (
      title: 'CyberSentry',
      type: 'Personal project · Cybersecurity',
      description:
          'A monitoring platform for websites, domains, public IP addresses, and GitHub repositories, with automated threat and anomaly analysis.',
      technologies: 'React · Django · Security monitoring',
    ),
    (
      title: 'CVInsight',
      type: 'Personal project · NLP',
      description:
          'An intelligent CV analysis tool that uses Ollama and NLP techniques to extract and structure skills, experience, and education.',
      technologies: 'React · Spring Boot · Ollama · NLP',
    ),
    (
      title: 'RideBuddy',
      type: 'Collaborative project',
      description:
          'A responsive carpooling application for discovering trips, managing reservations, and connecting drivers with passengers.',
      technologies: 'Web application · Full-stack',
    ),
    (
      title: 'Code Charta',
      type: 'Open-source contribution · 2024',
      description:
          'Improved the Three.js visualization experience by refactoring camera navigation, zoom, panning, and controls for complex software structures.',
      technologies: 'Three.js · Open source',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 104, 24, 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Projects',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Selected work across cybersecurity, intelligent applications, visualization, and full-stack development.',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.72),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 760 ? 2 : 1;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projects.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: columns == 2 ? 1.25 : 1.35,
                    ),
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      return _ProjectCard(
                        title: project.title,
                        type: project.type,
                        description: project.description,
                        technologies: project.technologies,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.title,
    required this.type,
    required this.description,
    required this.technologies,
  });

  final String title;
  final String type;
  final String description;
  final String technologies;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
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
            type,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: theme.textTheme.bodyLarge?.copyWith(
              height: 1.55,
              color: theme.colorScheme.onSurface.withOpacity(0.76),
            ),
          ),
          const Spacer(),
          const SizedBox(height: 16),
          Text(
            technologies,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
