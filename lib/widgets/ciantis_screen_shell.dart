import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';

import 'bottom_nav_bar.dart';
import 'side_menu.dart';
import 'top_bar.dart';

class CiantisScreenShell extends StatefulWidget {
  final Widget child;

  const CiantisScreenShell({
    super.key,
    required this.child,
  });

  @override
  State<CiantisScreenShell> createState() =>
      _CiantisScreenShellState();
}

class _CiantisScreenShellState
    extends State<CiantisScreenShell> {
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  bool showGridMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const SideMenu(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: CiantisTheme.mainGradient,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(
              CiantisTheme.overlayOpacity,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                TopBar(
                  showGridMenu: showGridMenu,
                  onMenuPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  onGridPressed: () {
                    setState(() {
                      showGridMenu = !showGridMenu;
                    });
                  },
                ),
                Expanded(
                  child: widget.child,
                ),
                const SizedBox(height: 110),
              ],
            ),
          ),
          BottomNavBar(
            showGridMenu: showGridMenu,
            onMenuPressed: () {
              setState(() {
                showGridMenu = !showGridMenu;
              });
            },
          ),
        ],
      ),
    );
  }
}
