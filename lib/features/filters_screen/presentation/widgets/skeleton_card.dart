import 'package:flutter/material.dart';
import 'package:weather_app/common/theme_extension';

//  Ekran yüklenirken gösterilen iskelet kart bileşeni
class SkeletonCard extends StatelessWidget {
  const SkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          color: context.colors.surface.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: context.colors.surface.withValues(alpha: 0.12),
          ),
        ),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 18),
            _shimmerBox(width: 80, height: 40, context: context),
            const SizedBox(width: 12),
            _shimmerBox(width: 90, height: 22, context: context),
            const Spacer(),
            _shimmerBox(width: 70, height: 70, context: context),
            const SizedBox(width: 18),
          ],
        ),
      ),
    );
  }

  Widget _shimmerBox({
    required double width,
    required double height,
    required BuildContext context,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.colors.surface.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
