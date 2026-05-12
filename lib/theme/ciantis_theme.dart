import 'package:flutter/material.dart';

class CiantisTheme {
  // APP COLORS
  static const Color backgroundTop = Color(0xFF7A5A47);
  static const Color backgroundMiddle = Color(0xFF9B7B66);
  static const Color backgroundBottom = Color(0xFFD8C2AE);

  static const Color creamPanel = Color(0xFFF5EEE7);
  static const Color warmBrown = Color(0xFF8D6748);
  static const Color deepBrown = Color(0xFF7B5A43);
  static const Color profileBrown = Color(0xFF8B5E4A);

  static const Color white = Colors.white;
  static const Color whiteSoft = Colors.white70;
  static const Color textBrown = Color(0xFF5D4638);

  // GLASS EFFECTS
  static const double glassOpacity = 0.15;
  static const double glassBorderOpacity = 0.20;
  static const double overlayOpacity = 0.15;

  // BLUR
  static const double blurLight = 20;
  static const double blurHeavy = 25;

  // RADIUS
  static const double radiusSmall = 18;
  static const double radiusMedium = 20;
  static const double radiusLarge = 28;
  static const double radiusXLarge = 30;
  static const double radiusSheet = 34;
  static const double radiusDrawer = 40;

  // SPACING
  static const double pagePadding = 22;
  static const double bottomBarHeight = 72;
  static const double bottomBarBottomPadding = 30;

  // FONT SIZES
  static const double titleSize = 28;
  static const double appTitleSize = 24;
  static const double bodySize = 15;
  static const double smallSize = 12;

  // BACKGROUND GRADIENT
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      backgroundTop,
      backgroundMiddle,
      backgroundBottom,
    ],
  );

  // APP THEME
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Color(0xFFF6F0EA),
    fontFamily: 'SF Pro Display',
  );
}
