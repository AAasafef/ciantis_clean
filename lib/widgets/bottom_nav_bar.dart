import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';
import '../data/bottom_nav_items.dart';
import 'glass_container.dart';

class BottomNavBar extends StatelessWidget {
  final bool showGridMenu;
  final VoidCallback onMenuPressed;

  const BottomNavBar({
    super.key,
    required this.showGridMenu,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 24,
      right: 24,
      bottom: CiantisTheme.bottomBarBottomPadding,
      child: GlassContainer(
        borderRadius: CiantisTheme.radiusLarge,
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: CiantisTheme.bottomBarHeight,
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
            children: [

              ...bottomNavItems.map(
                (item) {

                  // CENTER MENU BUTTON
                  if (item.title == 'Calendar') {
                    return GestureDetector(
                      onTap: onMenuPressed,
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          color: CiantisTheme.white,
                          borderRadius:
                              BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Icon(
                          showGridMenu
                              ? Icons.close_rounded
                              : Icons.apps_rounded,
                          color:
                              CiantisTheme.deepBrown,
                        ),
                      ),
                    );
                  }

                  return Icon(
                    item.icon,
                    color: CiantisTheme.white,
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
