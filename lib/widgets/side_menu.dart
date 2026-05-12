import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';

import '../data/side_menu_items.dart';

import 'glass_container.dart';
import 'luxury_avatar.dart';
import 'side_menu_item_tile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,

      child: GlassContainer(
        borderRadius:
            CiantisTheme.radiusDrawer,

        padding: const EdgeInsets.all(
          24,
        ),

        child: SafeArea(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              _profileHeader(),

              const SizedBox(height: 40),

              Expanded(
                child: ListView(
                  children: [

                    SideMenuItemTile(
                      icon: Icons.home_outlined,
                      title: 'Dashboard',
                      badgeCount: '2',
                      onTap: () {},
                    ),

                    SideMenuItemTile(
                      icon:
                          Icons.notifications_none,
                      title: 'Notifications',
                      badgeCount: '5',
                      onTap: () {},
                    ),

                    SideMenuItemTile(
                      icon:
                          Icons.favorite_border,
                      title: 'Goals',
                      onTap: () {},
                    ),

                    SideMenuItemTile(
                      icon:
                          Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {},
                    ),

                    SideMenuItemTile(
                      icon:
                          Icons.person_outline,
                      title: 'Profile',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // PROFILE HEADER
  Widget _profileHeader() {
    return Row(
      children: [

        const LuxuryAvatar(),

        const SizedBox(width: 16),

        const Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              'the life',
              style: TextStyle(
                color: CiantisTheme.white,
                fontSize:
                    CiantisTheme.titleSize,
                fontWeight:
                    FontWeight.w300,
              ),
            ),

            SizedBox(height: 4),

            Text(
              'I\'M BUILDING',
              style: TextStyle(
                color:
                    CiantisTheme.whiteSoft,
                letterSpacing: 2,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
