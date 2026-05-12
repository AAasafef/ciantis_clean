import 'package:flutter/material.dart';

import '../theme/ciantis_theme.dart';

import 'glass_container.dart';
import 'luxury_divider.dart';

class LuxuryCard extends StatelessWidget {
  final IconData icon;

  final String title;

  final String subtitle;

  final Widget? trailing;

  final VoidCallback? onTap;

  const LuxuryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: GestureDetector(
        onTap: onTap,

        child: GlassContainer(
          padding: const EdgeInsets.all(
            18,
          ),

          borderRadius:
              CiantisTheme.radiusLarge,

          child: Column(
            children: [

              Row(
                children: [

                  Icon(
                    icon,
                    color:
                        CiantisTheme.white,
                    size: 30,
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [

                        Text(
                          title,
                          style:
                              const TextStyle(
                            color:
                                CiantisTheme
                                    .white,
                            fontSize: 18,
                            fontWeight:
                                FontWeight
                                    .w300,
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        Text(
                          subtitle,
                          style:
                              const TextStyle(
                            color:
                                CiantisTheme
                                    .whiteSoft,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (trailing != null)
                    trailing!,
                ],
              ),

              const LuxuryDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
