import 'package:flutter/material.dart';

import '../../models/settings_model.dart';

import '../../services/settings_service.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/luxury_page_padding.dart';
import '../../widgets/luxury_scroll_view.dart';
import '../../widgets/luxury_section_spacing.dart';
import '../../widgets/luxury_toggle_card.dart';
import '../../widgets/page_header.dart';
import '../../widgets/section_title.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {

  late SettingsModel settings;

  @override
  void initState() {
    super.initState();

    settings =
        SettingsService.instance
            .getSettings();
  }

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
                title: 'Settings',
                subtitle:
                    'Customize your Life OS experience.',
              ),

              const LuxurySectionSpacing(),

              // PREFERENCES
              const SectionTitle(
                title: 'Preferences',
              ),

              LuxuryToggleCard(
                icon:
                    Icons.notifications_none,
                title: 'Notifications',
                subtitle:
                    'Enable reminders and alerts.',
                value:
                    settings
                        .notificationsEnabled,
                onChanged: (value) {

                  setState(() {
                    settings =
                        settings.copyWith(
                      notificationsEnabled:
                          value,
                    );
                  });

                  SettingsService.instance
                      .toggleNotifications(
                    value,
                  );
                },
              ),

              LuxuryToggleCard(
                icon:
                    Icons.dark_mode_outlined,
                title: 'Dark Mode',
                subtitle:
                    'Use luxury dark appearance.',
                value:
                    settings.darkMode,
                onChanged: (value) {

                  setState(() {
                    settings =
                        settings.copyWith(
                      darkMode: value,
                    );
                  });

                  SettingsService.instance
                      .toggleDarkMode(
                    value,
                  );
                },
              ),

              LuxuryToggleCard(
                icon:
                    Icons.fingerprint_outlined,
                title: 'Biometric Security',
                subtitle:
                    'Use fingerprint or face unlock.',
                value:
                    settings
                        .biometricsEnabled,
                onChanged: (value) {

                  setState(() {
                    settings =
                        settings.copyWith(
                      biometricsEnabled:
                          value,
                    );
                  });

                  SettingsService.instance
                      .toggleBiometrics(
                    value,
                  );
                },
              ),

              LuxuryToggleCard(
                icon:
                    Icons.volume_up_outlined,
                title: 'Sounds',
                subtitle:
                    'Enable luxury UI sounds.',
                value:
                    settings
                        .soundsEnabled,
                onChanged: (value) {

                  setState(() {
                    settings =
                        settings.copyWith(
                      soundsEnabled:
                          value,
                    );
                  });

                  SettingsService.instance
                      .toggleSounds(
                    value,
                  );
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
