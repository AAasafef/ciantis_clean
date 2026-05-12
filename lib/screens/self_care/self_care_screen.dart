import 'package:flutter/material.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/luxury_page_padding.dart';
import '../../widgets/luxury_scroll_view.dart';
import '../../widgets/luxury_section_spacing.dart';
import '../../widgets/luxury_toggle_card.dart';
import '../../widgets/page_header.dart';
import '../../widgets/section_title.dart';

class SelfCareScreen extends StatefulWidget {
  const SelfCareScreen({super.key});

  @override
  State<SelfCareScreen> createState() =>
      _SelfCareScreenState();
}

class _SelfCareScreenState
    extends State<SelfCareScreen> {

  bool skincare = true;
  bool hydration = true;
  bool vitamins = false;
  bool meditation = true;

  @override
  Widget build(BuildContext context) {
    return CiantisScreenShell(
      child: LuxuryPagePadding(
        child: LuxuryScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              // HEADER
              const PageHeader(
                title: 'Self Care',
                subtitle:
                    'Protect your peace, beauty, health, and energy.',
              ),

              const LuxurySectionSpacing(),

              // ROUTINES
              const SectionTitle(
                title: 'Daily Wellness',
              ),

              LuxuryToggleCard(
                icon: Icons.face_outlined,
                title: 'Skincare Routine',
                subtitle:
                    'Morning + evening skincare.',
                value: skincare,
                onChanged: (value) {
                  setState(() {
                    skincare = value;
                  });
                },
              ),

              LuxuryToggleCard(
                icon:
                    Icons.water_drop_outlined,
                title: 'Hydration Goal',
                subtitle:
                    'Drink your daily water target.',
                value: hydration,
                onChanged: (value) {
                  setState(() {
                    hydration = value;
                  });
                },
              ),

              LuxuryToggleCard(
                icon:
                    Icons.medication_outlined,
                title: 'Vitamins',
                subtitle:
                    'Daily supplements and wellness support.',
                value: vitamins,
                onChanged: (value) {
                  setState(() {
                    vitamins = value;
                  });
                },
              ),

              LuxuryToggleCard(
                icon: Icons.spa_outlined,
                title: 'Meditation',
                subtitle:
                    'Protect your peace and mental clarity.',
                value: meditation,
                onChanged: (value) {
                  setState(() {
                    meditation = value;
                  });
                },
              ),

              const LuxurySectionSpacing(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
