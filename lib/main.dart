import 'dart:ui';
import 'package:flutter/material.dart';

import 'theme/ciantis_theme.dart';
import 'data/app_items.dart';

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
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool showGridMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: _sideMenu(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: CiantisTheme.mainGradient,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(CiantisTheme.overlayOpacity),
          ),
          SafeArea(
            child: Column(
              children: [
                _topBar(),
                const Spacer(),
                if (!showGridMenu) _homePanel(),
                if (showGridMenu) _gridMenu(),
                const SizedBox(height: 110),
              ],
            ),
          ),
          _bottomTaskbar(),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CiantisTheme.pagePadding,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const Icon(
              Icons.menu_rounded,
              color: CiantisTheme.white,
              size: 28,
            ),
          ),
          const Text(
            'the life',
            style: TextStyle(
              color: CiantisTheme.white,
              fontSize: CiantisTheme.appTitleSize,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showGridMenu = !showGridMenu;
              });
            },
            child: Icon(
              showGridMenu ? Icons.close_rounded : Icons.apps_rounded,
              color: CiantisTheme.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _homePanel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(CiantisTheme.radiusXLarge),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: CiantisTheme.blurLight,
            sigmaY: CiantisTheme.blurLight,
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(CiantisTheme.glassOpacity),
              borderRadius: BorderRadius.circular(CiantisTheme.radiusXLarge),
              border: Border.all(
                color: Colors.white.withOpacity(
                  CiantisTheme.glassBorderOpacity,
                ),
              ),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(
                    color: CiantisTheme.whiteSoft,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Your luxury life OS',
                  style: TextStyle(
                    color: CiantisTheme.white,
                    fontSize: CiantisTheme.titleSize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Everything organized beautifully.',
                  style: TextStyle(
                    color: CiantisTheme.whiteSoft,
                    fontSize: CiantisTheme.bodySize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _gridMenu() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: CiantisTheme.pagePadding,
          vertical: 18,
        ),
        decoration: const BoxDecoration(
          color: CiantisTheme.creamPanel,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(CiantisTheme.radiusSheet),
            topRight: Radius.circular(CiantisTheme.radiusSheet),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: CiantisTheme.white,
                hintText: 'Search anything...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: ciantisApps.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 18,
                  childAspectRatio: .82,
                ),
                itemBuilder: (context, index) {
                  final app = ciantisApps[index];

                  return Column(
                    children: [
                      Container(
                        height: 68,
                        width: 68,
                        decoration: BoxDecoration(
                          color: CiantisTheme.white,
                          borderRadius: BorderRadius.circular(
                            CiantisTheme.radiusMedium,
                          ),
                        ),
                        child: Icon(
                          app.icon,
                          color: CiantisTheme.warmBrown,
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        app.title,
                        style: const TextStyle(
                          fontSize: CiantisTheme.smallSize,
                          color: CiantisTheme.textBrown,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomTaskbar() {
    return Positioned(
      left: 24,
      right: 24,
      bottom: CiantisTheme.bottomBarBottomPadding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(CiantisTheme.radiusLarge),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: CiantisTheme.blurLight,
            sigmaY: CiantisTheme.blurLight,
          ),
          child: Container(
            height: CiantisTheme.bottomBarHeight,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(CiantisTheme.glassOpacity),
              borderRadius: BorderRadius.circular(CiantisTheme.radiusLarge),
              border: Border.all(
                color: Colors.white.withOpacity(
                  CiantisTheme.glassBorderOpacity,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.home_outlined, color: CiantisTheme.white),
                const Icon(Icons.favorite_border, color: CiantisTheme.white),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showGridMenu = !showGridMenu;
                    });
                  },
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: CiantisTheme.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      showGridMenu ? Icons.close_rounded : Icons.apps_rounded,
                      color: CiantisTheme.deepBrown,
                    ),
                  ),
                ),
                const Icon(
                  Icons.calendar_month_outlined,
                  color: CiantisTheme.white,
                ),
                const Icon(Icons.person_outline, color: CiantisTheme.white),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sideMenu() {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(CiantisTheme.radiusDrawer),
          bottomRight: Radius.circular(CiantisTheme.radiusDrawer),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: CiantisTheme.blurHeavy,
            sigmaY: CiantisTheme.blurHeavy,
          ),
          child: Container(
            color: Colors.brown.withOpacity(.35),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 34,
                          backgroundColor: CiantisTheme.profileBrown,
                          child: const Icon(
                            Icons.person,
                            color: CiantisTheme.white,
                            size: 34,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'the life',
                              style: TextStyle(
                                color: CiantisTheme.white,
                                fontSize: CiantisTheme.titleSize,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'I\'M BUILDING',
                              style: TextStyle(
                                color: CiantisTheme.whiteSoft,
                                letterSpacing: 2,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    _menuItem(Icons.home_outlined, 'Home'),
                    _menuItem(Icons.favorite_border, 'Goals'),
                    _menuItem(Icons.check_circle_outline, 'Habits'),
                    _menuItem(Icons.menu_book_outlined, 'Journal'),
                    _menuItem(Icons.spa_outlined, 'Self Care'),
                    _menuItem(Icons.settings_outlined, 'Settings'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        children: [
          Icon(icon, color: CiantisTheme.white, size: 24),
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
    );
  }
}
