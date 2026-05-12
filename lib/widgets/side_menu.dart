import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';

import '../data/side_menu_items.dart';

import 'glass_container.dart';
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
                child: ListView.builder(
                  itemCount:
                      sideMenuItems.length,
                  itemBuilder:
                      (context, index) {

                    final item =
                        sideMenuItems[index];

                    return SideMenuItemTile(
                      icon: item.icon,
                      title: item.title,
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // PROFILE
  Widget _profileHeader() {
    return Row(
      children: [

        CircleAvatar(
          radius: 34,
          backgroundColor:
              CiantisTheme.profileBrown,
          child: const Icon(
            Icons.person,
            color: CiantisTheme.white,
            size: 34,
          ),
        ),

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
