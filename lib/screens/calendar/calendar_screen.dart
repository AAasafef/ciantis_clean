import 'package:flutter/material.dart';

import '../../theme/ciantis_theme.dart';

import '../../widgets/glass_container.dart';
import '../../widgets/top_bar.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/side_menu.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() =>
      _CalendarScreenState();
}

class _CalendarScreenState
    extends State<CalendarScreen> {

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

                const SizedBox(
                  height: 30,
                ),

                // TITLE
                const Text(
                  'Calendar',
                  style: TextStyle(
                    color:
                        CiantisTheme.white,
                    fontSize: 34,
                    fontWeight:
                        FontWeight.w300,
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                // CALENDAR CARD
                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: GlassContainer(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [

                        const Text(
                          'May 2026',
                          style: TextStyle(
                            color:
                                CiantisTheme
                                    .white,
                            fontSize: 24,
                            fontWeight:
                                FontWeight
                                    .w300,
                          ),
                        ),

                        const SizedBox(
                          height: 24,
                        ),

                        GridView.builder(
                          shrinkWrap: true,
                          physics:
                              const NeverScrollableScrollPhysics(),
                          itemCount: 35,

                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            mainAxisSpacing:
                                12,
                            crossAxisSpacing:
                                12,
                          ),

                          itemBuilder:
                              (
                            context,
                            index,
                          ) {

                            return Container(
                              decoration:
                                  BoxDecoration(
                                color: Colors
                                    .white
                                    .withOpacity(
                                  .12,
                                ),

                                borderRadius:
                                    BorderRadius.circular(
                                  14,
                                ),
                              ),

                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style:
                                      const TextStyle(
                                    color:
                                        CiantisTheme.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
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
