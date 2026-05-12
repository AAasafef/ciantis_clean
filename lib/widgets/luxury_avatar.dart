import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';

class LuxuryAvatar extends StatelessWidget {
  final double radius;

  const LuxuryAvatar({
    super.key,
    this.radius = 34,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor:
          CiantisTheme.profileBrown,

      child: Icon(
        Icons.person,
        color: CiantisTheme.white,
        size: radius,
      ),
    );
  }
}
