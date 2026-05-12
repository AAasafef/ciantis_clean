import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 18,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: CiantisTheme.white,
          fontSize: 24,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
