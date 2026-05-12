import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';
import 'glass_container.dart';

class EmptyStateCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const EmptyStateCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Column(
        children: [

          Icon(
            icon,
            color: CiantisTheme.whiteSoft,
            size: 54,
          ),

          const SizedBox(height: 18),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: CiantisTheme.white,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: CiantisTheme.whiteSoft,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
