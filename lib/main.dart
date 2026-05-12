import 'package:flutter/material.dart';

import 'theme/ciantis_theme.dart';

import 'data/side_menu_items.dart';

import 'widgets/bottom_nav_bar.dart';
import 'widgets/glass_container.dart';
import 'widgets/grid_menu.dart';
import 'widgets/home_panel.dart';
import 'widgets/side_menu_item_tile.dart';
import 'widgets/top_bar.dart';

void main() {
  runApp(const CiantisApp());
}

class CiantisApp extends StatelessWidget {
  const CiantisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ciantis',
      theme: CiantisTheme.themeData,
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState
    extends State<DashboardScreen> {

  final GlobalKey<ScaffoldState>
      scaffoldKey =
      GlobalKey<ScaffoldState>();

  bool showGridMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      drawer: _sideMenu(),

      body: Stack(
        children: [

          // BACKGROUND
          _background(),

          // OVERLAY
          _overlay(),

          SafeArea(
            child: Column(
              children: [

                // TOP BAR
                TopBar(
                  showGridMenu:
                      showGridMenu,
                  onMenuPressed: () {
                    scaffoldKey
                        .currentState
                        ?.openDrawer();
                  },
                  onGridPressed: () {
                    setState(() {
                      showGridMenu =
                          !showGridMenu;
                    });
                  },
                ),

                const Spacer(),

                // HOME PANEL
                if (!showGridMenu)
                  const HomePanel(),

                // GRID MENU
                if (showGridMenu)
                  const GridMenu(),

                const SizedBox(
                  height: 110,
                ),
              ],
            ),
          ),

          // BOTTOM BAR
          BottomNavBar(
            showGridMenu:
                showGridMenu,
            onMenuPressed: () {
              setState(() {
                showGridMenu =
                    !showGridMenu;
              });
            },
          ),
        ],
      ),
    );
  }

  // BACKGROUND
  Widget _background() {
    return Container(
      decoration: const BoxDecoration(
        gradient:
            CiantisTheme.mainGradient,
      ),
    );
  }

  // OVERLAY
  Widget _overlay() {
    return Container(
      color: Colors.black.withOpacity(
        CiantisTheme.overlayOpacity,
      ),
    );
  }

  // SIDE MENU
  Widget _sideMenu() {
    return Drawer(
      backgroundColor:
          Colors.transparent,
      child: GlassContainer(
        borderRadius:
            CiantisTheme
                .radiusDrawer,
        padding:
            const EdgeInsets.all(
          24,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .start,
            children: [

              _sideProfileHeader(),

              const SizedBox(
                height: 40,
              ),

              Expanded(
                child:
                    ListView.builder(
                  itemCount:
                      sideMenuItems
                          .length,
                  itemBuilder:
                      (
                    context,
                    index,
                  ) {

                    final item =
                        sideMenuItems[
                            index];

                    return SideMenuItemTile(
                      icon:
                          item.icon,
                      title:
                          item.title,
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
  Widget _sideProfileHeader() {
    return Row(
      children: [

        CircleAvatar(
          radius: 34,
          backgroundColor:
              CiantisTheme
                  .profileBrown,
          child: const Icon(
            Icons.person,
            color:
                CiantisTheme
                    .white,
            size: 34,
          ),
        ),

        const SizedBox(
          width: 16,
        ),

        const Column(
          crossAxisAlignment:
              CrossAxisAlignment
                  .start,
          children: [

            Text(
              'the life',
              style: TextStyle(
                color:
                    CiantisTheme
                        .white,
                fontSize:
                    CiantisTheme
                        .titleSize,
                fontWeight:
                    FontWeight.w300,
              ),
            ),

            SizedBox(
              height: 4,
            ),

            Text(
              'I\'M BUILDING',
              style: TextStyle(
                color:
                    CiantisTheme
                        .whiteSoft,
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
