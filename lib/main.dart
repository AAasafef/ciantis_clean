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
        scaffoldBackgroundColor: const Color(0xFFF6F2EC),
        fontFamily: 'Roboto',
      ),
      home: const CiantisDashboard(),
    );
  }
}

class CiantisDashboard extends StatefulWidget {
  const CiantisDashboard({super.key});

  @override
  State<CiantisDashboard> createState() => _CiantisDashboardState();
}

class _CiantisDashboardState extends State<CiantisDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showAppDrawer = false;

  final List<CiantisAppIcon> apps = const [
    CiantisAppIcon('Calendar', Icons.calendar_month_rounded),
    CiantisAppIcon('Health', Icons.favorite_rounded),
    CiantisAppIcon('Food', Icons.restaurant_rounded),
    CiantisAppIcon('Money', Icons.account_balance_wallet_rounded),
    CiantisAppIcon('Goals', Icons.flag_rounded),
    CiantisAppIcon('Tasks', Icons.check_circle_rounded),
    CiantisAppIcon('Files', Icons.folder_rounded),
    CiantisAppIcon('Books', Icons.menu_book_rounded),
    CiantisAppIcon('Beauty', Icons.spa_rounded),
    CiantisAppIcon('Shopping', Icons.shopping_bag_rounded),
    CiantisAppIcon('Family', Icons.groups_rounded),
    CiantisAppIcon('Settings', Icons.settings_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      // SIDE SWIPE MENU
      drawer: Drawer(
        backgroundColor: const Color(0xFFF9F5EF),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: const [
              Text(
                'Ciantis',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.dashboard_rounded),
                title: Text('Dashboard'),
              ),
              ListTile(
                leading: Icon(Icons.calendar_month_rounded),
                title: Text('Calendar'),
              ),
              ListTile(
                leading: Icon(Icons.favorite_rounded),
                title: Text('Health'),
              ),
              ListTile(
                leading: Icon(Icons.folder_rounded),
                title: Text('Important Files'),
              ),
              ListTile(
                leading: Icon(Icons.settings_rounded),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            _wallpaperBackground(),

            Column(
              children: [
                _topHeader(),
                Expanded(
                  child: showAppDrawer ? _appDrawerGrid() : _dashboardHome(),
                ),
              ],
            ),

            _bottomTaskbar(),
          ],
        ),
      ),
    );
  }

  Widget _wallpaperBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF8F2EA),
            Color(0xFFE7D8C9),
            Color(0xFFD8C1AD),
          ],
        ),
      ),
    );
  }

  Widget _topHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 14, 22, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: const Icon(Icons.menu_rounded, size: 30),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Good morning, Shaverian',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2B211C),
              ),
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFEBDDD2),
            child: Icon(Icons.person_rounded, color: Color(0xFF5D4638)),
          ),
        ],
      ),
    );
  }

  Widget _dashboardHome() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 10, 22, 110),
      child: ListView(
        children: [
          _glassCard(
            title: 'Today',
            subtitle: 'Your calm command center',
            icon: Icons.wb_sunny_rounded,
          ),
          const SizedBox(height: 18),
          _glassCard(
            title: 'Calendar',
            subtitle: 'Appointments, reminders, family plans',
            icon: Icons.calendar_month_rounded,
          ),
          const SizedBox(height: 18),
          _glassCard(
            title: 'Next Best Action',
            subtitle: 'Open app drawer to choose a section',
            icon: Icons.auto_awesome_rounded,
          ),
        ],
      ),
    );
  }

  Widget _glassCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.48),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white.withOpacity(0.65)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 22,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  color: const Color(0xFFB9967B),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(icon, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2A211D),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6E5B50),
                      ),
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

  Widget _appDrawerGrid() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 115),
      child: GridView.builder(
        itemCount: apps.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 4 apps across
          mainAxisSpacing: 22,
          crossAxisSpacing: 12,
          childAspectRatio: 0.78,
        ),
        itemBuilder: (context, index) {
          final app = apps[index];

          return Column(
            children: [
              Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFD5B9A1),
                      Color(0xFFA77F66),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.13),
                      blurRadius: 12,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Icon(app.icon, color: Colors.white, size: 30),
              ),
              const SizedBox(height: 7),
              Text(
                app.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2C221D),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _bottomTaskbar() {
    return Positioned(
      left: 18,
      right: 18,
      bottom: 24, // keeps it above Android back/home nav bar
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            height: 76,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.58),
              borderRadius: BorderRadius.circular(34),
              border: Border.all(color: Colors.white.withOpacity(0.75)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.13),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _taskbarIcon(Icons.home_rounded, () {
                  setState(() => showAppDrawer = false);
                }),

                _taskbarIcon(Icons.search_rounded, () {}),

                // CENTER APP DRAWER BUTTON
                GestureDetector(
                  onTap: () {
                    setState(() => showAppDrawer = !showAppDrawer);
                  },
                  child: Container(
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B211C),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.22),
                          blurRadius: 18,
                          offset: const Offset(0, 9),
                        ),
                      ],
                    ),
                    child: Icon(
                      showAppDrawer
                          ? Icons.close_rounded
                          : Icons.grid_view_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),

                _taskbarIcon(Icons.notifications_rounded, () {}),

                _taskbarIcon(Icons.person_rounded, () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _taskbarIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 29,
        color: const Color(0xFF2B211C),
      ),
    );
  }
}

class CiantisAppIcon {
  final String name;
  final IconData icon;

  const CiantisAppIcon(this.name, this.icon);
}
