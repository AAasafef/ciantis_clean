import 'dart:ui';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F0EA),
        fontFamily: 'SF Pro Display',
      ),
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
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  bool showGridMenu = false;

  final List<Map<String, dynamic>> apps = [
    {'title': 'Home', 'icon': Icons.home_outlined},
    {'title': 'Goals', 'icon': Icons.favorite_border},
    {'title': 'Habits', 'icon': Icons.check_circle_outline},
    {'title': 'Journal', 'icon': Icons.menu_book_outlined},
    {'title': 'Self Care', 'icon': Icons.spa_outlined},
    {'title': 'Finances', 'icon': Icons.account_balance_wallet_outlined},
    {'title': 'Education', 'icon': Icons.school_outlined},
    {'title': 'Wellness', 'icon': Icons.monitor_heart_outlined},
    {'title': 'Projects', 'icon': Icons.folder_outlined},
    {'title': 'Calendar', 'icon': Icons.calendar_month_outlined},
    {'title': 'Notes', 'icon': Icons.edit_note_outlined},
    {'title': 'Resources', 'icon': Icons.widgets_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      // SIDE SWIPE MENU
      drawer: _sideMenu(),

      body: Stack(
        children: [

          // BACKGROUND
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF7A5A47),
                  Color(0xFF9B7B66),
                  Color(0xFFD8C2AE),
                ],
              ),
            ),
          ),

          // OVERLAY
          Container(
            color: Colors.black.withOpacity(.15),
          ),

          SafeArea(
            child: Column(
              children: [

                // TOP BAR
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [

                      // SIDE MENU BUTTON
                      GestureDetector(
                        onTap: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        child: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),

                      const Text(
                        'the life',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                        ),
                      ),

                      // GRID MENU BUTTON
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showGridMenu = !showGridMenu;
                          });
                        },
                        child: Icon(
                          showGridMenu
                              ? Icons.close_rounded
                              : Icons.apps_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // HOME PANEL
                if (!showGridMenu)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 20,
                          sigmaY: 20,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.15),
                            borderRadius:
                                BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white.withOpacity(.2),
                            ),
                          ),
                          child: const Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Text(
                                'Welcome back',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),

                              SizedBox(height: 8),

                              Text(
                                'Your luxury life OS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),

                              SizedBox(height: 12),

                              Text(
                                'Everything organized beautifully.',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                // GRID MENU
                if (showGridMenu)
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 18,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5EEE7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34),
                          topRight: Radius.circular(34),
                        ),
                      ),
                      child: Column(
                        children: [

                          Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // SEARCH
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Search anything...',
                              prefixIcon:
                                  const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // APP GRID
                          Expanded(
                            child: GridView.builder(
                              itemCount: apps.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 18,
                                childAspectRatio: .82,
                              ),
                              itemBuilder: (context, index) {

                                final app = apps[index];

                                return Column(
                                  children: [

                                    Container(
                                      height: 68,
                                      width: 68,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      child: Icon(
                                        app['icon'],
                                        color: const Color(
                                            0xFF8D6748),
                                        size: 28,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      app['title'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF5D4638),
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
                  ),

                const SizedBox(height: 110),
              ],
            ),
          ),

          // FLOATING TASKBAR
          Positioned(
            left: 24,
            right: 24,
            bottom: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 20,
                ),
                child: Container(
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.15),
                    borderRadius:
                        BorderRadius.circular(28),
                    border: Border.all(
                      color: Colors.white.withOpacity(.2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                    children: [

                      const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),

                      const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),

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
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: Icon(
                            showGridMenu
                                ? Icons.close_rounded
                                : Icons.apps_rounded,
                            color: const Color(0xFF7B5A43),
                          ),
                        ),
                      ),

                      const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                      ),

                      const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideMenu() {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 25,
            sigmaY: 25,
          ),
          child: Container(
            color: Colors.brown.withOpacity(.35),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    // PROFILE
                    Row(
                      children: [

                        CircleAvatar(
                          radius: 34,
                          backgroundColor:
                              const Color(0xFF8B5E4A),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
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
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight:
                                    FontWeight.w300,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              'I\'M BUILDING',
                              style: TextStyle(
                                color: Colors.white70,
                                letterSpacing: 2,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    _menuItem(
                      Icons.home_outlined,
                      'Home',
                    ),

                    _menuItem(
                      Icons.favorite_border,
                      'Goals',
                    ),

                    _menuItem(
                      Icons.check_circle_outline,
                      'Habits',
                    ),

                    _menuItem(
                      Icons.menu_book_outlined,
                      'Journal',
                    ),

                    _menuItem(
                      Icons.spa_outlined,
                      'Self Care',
                    ),

                    _menuItem(
                      Icons.settings_outlined,
                      'Settings',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        children: [

          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),

          const SizedBox(width: 16),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
