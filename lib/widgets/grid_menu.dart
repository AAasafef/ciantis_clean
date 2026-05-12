import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';

import '../data/app_registry.dart';

import 'app_icon_tile.dart';
import 'luxury_text_field.dart';

class GridMenu extends StatelessWidget {
  const GridMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: CiantisTheme.pagePadding,
          vertical: 18,
        ),
        decoration: const BoxDecoration(
          color: CiantisTheme.creamPanel,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              CiantisTheme.radiusSheet,
            ),
            topRight: Radius.circular(
              CiantisTheme.radiusSheet,
            ),
          ),
        ),
        child: Column(
          children: [

            // DRAG BAR
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius:
                    BorderRadius.circular(
                  20,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // SEARCH
            const LuxuryTextField(
              hintText:
                  'Search anything...',
              icon: Icons.search,
            ),

            const SizedBox(height: 24),

            // APPS
            Expanded(
              child: GridView.builder(
                itemCount: ciantisApps.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 18,
                  childAspectRatio: .82,
                ),

                itemBuilder:
                    (context, index) {

                  final app =
                      ciantisApps[index];

                  return AppIconTile(
                    title: app.title,
                    icon: app.icon,

                    onTap: () {
                      if (app.screen !=
                          null) {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    app.screen!,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
