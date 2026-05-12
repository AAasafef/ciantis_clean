import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';

class SideMenuItemTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const SideMenuItemTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 22,
        ),
        child: Row(
          children: [

            Icon(
              icon,
              color: CiantisTheme.white,
              size: 24,
            ),

            const SizedBox(width: 16),

            Text(
              title,
              style: const TextStyle(
                color: CiantisTheme.white,
                fontSize: 17,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
