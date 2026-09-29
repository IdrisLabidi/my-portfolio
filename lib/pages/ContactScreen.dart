import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _open(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not open $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface.withOpacity(0.72),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: theme.colorScheme.outlineVariant.withOpacity(0.7),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Let’s connect',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'I am open to conversations about software engineering, internships, collaborations, and interesting technical projects.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    height: 1.5,
                    color: theme.colorScheme.onSurface.withOpacity(0.75),
                  ),
                ),
                const SizedBox(height: 28),
                FilledButton.icon(
                  onPressed: () => _open(
                    Uri(
                      scheme: 'mailto',
                      path: 'idrislaabidi@gmail.com',
                      queryParameters: {'subject': 'Portfolio contact'},
                    ),
                  ),
                  icon: const Icon(Icons.email_outlined),
                  label: const Text('idrislaabidi@gmail.com'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () =>
                      _open(Uri(scheme: 'tel', path: '+216xxxxxxxx')),
                  icon: const Icon(Icons.phone_outlined),
                  label: const Text('+216 xx xxx xxx'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
