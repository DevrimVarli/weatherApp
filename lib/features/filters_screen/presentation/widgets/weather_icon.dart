import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Hava durumu simgesini gösteren bileşen
class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      clipBehavior: Clip.antiAlias,
      child: (url.isEmpty)
          ? const Icon(Icons.cloud, color: Colors.white, size: 40)
          : Lottie.asset(
              'assets/animated/${url.toLowerCase()}.json',
              repeat: true,
            ),
    );
  }
}
