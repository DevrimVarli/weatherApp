import 'package:flutter/material.dart';

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
          color: Colors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
        ),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 18),
            _shimmerBox(width: 80, height: 40),
            const SizedBox(width: 12),
            _shimmerBox(width: 90, height: 22),
            const Spacer(),
            _shimmerBox(width: 70, height: 70),
            const SizedBox(width: 18),
          ],
        ),
      ),
    );
  }

  Widget _shimmerBox({required double width, required double height}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
