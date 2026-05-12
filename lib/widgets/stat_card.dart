import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';
import 'glass_container.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(18),
      borderRadius: CiantisTheme.radiusLarge,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          Icon(
            icon,
            color: CiantisTheme.whiteSoft,
            size: 28,
          ),

          const SizedBox(height: 18),

          Text(
            value,
            style: const TextStyle(
              color: CiantisTheme.white,
              fontSize: 28,
              fontWeight: FontWeight.w300,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
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
