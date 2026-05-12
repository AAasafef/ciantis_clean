import 'package:flutter/material.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/luxury_list_tile.dart';
import '../../widgets/luxury_page_padding.dart';
import '../../widgets/luxury_scroll_view.dart';
import '../../widgets/luxury_section_spacing.dart';
import '../../widgets/page_header.dart';
import '../../widgets/section_title.dart';
import '../../widgets/stat_card.dart';

class FinancesScreen extends StatelessWidget {
  const FinancesScreen({super.key});

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
                title: 'Finances',
                subtitle:
                    'Manage your money, goals, savings, and future.',
              ),

              const LuxurySectionSpacing(),

              // BALANCE CARD
              const StatCard(
                title: 'Current Savings',
                value: '\$8,420',
                progress: .62,
                icon:
                    Icons.account_balance_wallet_outlined,
              ),

              const LuxurySectionSpacing(),

              // SECTIONS
              const SectionTitle(
                title: 'Money Management',
              ),

              LuxuryListTile(
                icon: Icons.receipt_long_outlined,
                title: 'Bills',
                subtitle:
                    'Track monthly payments and due dates.',
                onTap: () {},
              ),

              LuxuryListTile(
                icon: Icons.savings_outlined,
                title: 'Savings Goals',
                subtitle:
                    'Build wealth and emergency funds.',
                onTap: () {},
              ),

              LuxuryListTile(
                icon:
                    Icons.bar_chart_outlined,
                title: 'Budget Planning',
                subtitle:
                    'Organize spending categories.',
                onTap: () {},
              ),

              LuxuryListTile(
                icon:
                    Icons.trending_up_outlined,
                title: 'Investments',
                subtitle:
                    'Monitor long-term financial growth.',
                onTap: () {},
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
