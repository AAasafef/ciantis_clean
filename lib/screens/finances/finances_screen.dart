import 'package:flutter/material.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/placeholder_page.dart';

class FinancesScreen extends StatelessWidget {
  const FinancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CiantisScreenShell(
      child: PlaceholderPage(
        title: 'Finances',
        subtitle:
            'Income, savings, budgets, bills, goals, and financial planning.',
        icon: Icons.account_balance_wallet_outlined,
      ),
    );
  }
}
