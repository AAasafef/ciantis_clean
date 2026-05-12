import 'package:flutter/material.dart';

import '../../theme/ciantis_theme.dart';

import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/grid_menu.dart';
import '../../widgets/home_panel.dart';
import '../../widgets/horizontal_card_scroll.dart';
import '../../widgets/luxury_page_padding.dart';
import '../../widgets/luxury_scroll_view.dart';
import '../../widgets/luxury_section_spacing.dart';
import '../../widgets/quote_card.dart';
import '../../widgets/section_title.dart';
import '../../widgets/side_menu.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/top_bar.dart';

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

      drawer: const SideMenu(),

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

                Expanded(
                  child: showGridMenu
                      ? const GridMenu()
                      : LuxuryPagePadding(
                          child:
                              LuxuryScrollView(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [

                                // HOME PANEL
                                const HomePanel(),

                                const LuxurySectionSpacing(),

                                // STATS
                                const SectionTitle(
                                  title:
                                      'Today',
                                ),

                                HorizontalCardScroll(
                                  children: const [

                                    SizedBox(
                                      width:
                                          170,
                                      child:
                                          StatCard(
                                        title:
                                            'Tasks Completed',
                                        value:
                                            '12',
                                        icon:
                                            Icons.check_circle_outline,
                                      ),
                                    ),

                                    SizedBox(
                                      width:
                                          170,
                                      child:
                                          StatCard(
                                        title:
                                            'Water Intake',
                                        value:
                                            '84%',
                                        icon:
                                            Icons.water_drop_outlined,
                                      ),
                                    ),

                                    SizedBox(
                                      width:
                                          170,
                                      child:
                                          StatCard(
                                        title:
                                            'Focus Score',
                                        value:
                                            '91%',
                                        icon:
                                            Icons.psychology_outlined,
                                      ),
                                    ),

                                    SizedBox(
                                      width:
                                          170,
                                      child:
                                          StatCard(
                                        title:
                                            'Mood',
                                        value:
                                            'Calm',
                                        icon:
                                            Icons.spa_outlined,
                                      ),
                                    ),
                                  ],
                                ),

                                const LuxurySectionSpacing(),

                                // QUOTES
                                const QuoteCard(
                                  quote:
                                      'Your future is built by what you do repeatedly.',
                                  author:
                                      'Ciantis',
                                ),

                                const LuxurySectionSpacing(),

                                const QuoteCard(
                                  quote:
                                      'Luxury is peace, organization, clarity, and control.',
                                  author:
                                      'The Life OS',
                                ),

                                const SizedBox(
                                  height: 120,
                                ),
                              ],
                            ),
                          ),
                        ),
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
}
