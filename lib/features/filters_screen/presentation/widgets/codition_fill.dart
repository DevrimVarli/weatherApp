import 'package:flutter/material.dart';
import 'package:weather_app/common/theme_extension';

// Hava Durumu koşulunu gösteren küçük container
class ConditionPill extends StatelessWidget {
  const ConditionPill({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    String t = text.isEmpty ? '—' : text.toUpperCase();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: context.colors.surface.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: context.colors.surface.withValues(alpha: 0.12),
        ),
      ),
      child: Text(
        t,
        style: textTheme.titleSmall?.copyWith(color: colorScheme.surface),
      ),
    );
  }
}
