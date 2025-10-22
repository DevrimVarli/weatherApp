import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/features/filters_screen/presentation/widgets/skeleton_card.dart';

/// ——— yükleniyor iskeleti ———
class SkeletonList extends StatelessWidget {
  const SkeletonList({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[HexColor('#2E335A'), HexColor('#1C1B33')],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 28),
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (_, __) => SkeletonCard(),
      ),
    );
  }
}
