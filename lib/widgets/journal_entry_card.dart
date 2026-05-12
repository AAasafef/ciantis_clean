import 'package:flutter/material.dart';

import '../models/journal_entry_model.dart';

import '../theme/ciantis_theme.dart';

import 'glass_container.dart';

class JournalEntryCard extends StatelessWidget {
  final JournalEntryModel entry;

  const JournalEntryCard({
    super.key,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: GlassContainer(
        borderRadius:
            CiantisTheme.radiusLarge,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              entry.title,
              style: const TextStyle(
                color: CiantisTheme.white,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              entry.content,
              style: const TextStyle(
                color:
                    CiantisTheme.whiteSoft,
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 18),

            Text(
              _formatDate(
                entry.createdAt,
              ),
              style: TextStyle(
                color: Colors.white
                    .withOpacity(.45),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(
    DateTime date,
  ) {
    return
        '${date.month}/${date.day}/${date.year}';
  }
}
