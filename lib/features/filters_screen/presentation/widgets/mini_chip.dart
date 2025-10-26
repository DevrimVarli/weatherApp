import 'package:flutter/material.dart';
import 'package:weather_app/common/theme_extension';

//ekranın alt kısmındaki max ve min değerlerini gösteren container
class MiniChip extends StatelessWidget {
  const MiniChip({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });
  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: context.colors.surface.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.surface.withValues(alpha: 0.12),
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 16,
            color: context.colors.surface.withValues(alpha: 0.9),
          ),
          const SizedBox(width: 6),
          Text(
            '$label: ',
            style: textTheme.titleSmall?.copyWith(
              color: colorScheme.surface.withValues(alpha: 0.8),
            ),
          ),
          Text(
            value,
            style: textTheme.titleSmall?.copyWith(color: colorScheme.surface),
          ),
        ],
      ),
    );
  }
}
