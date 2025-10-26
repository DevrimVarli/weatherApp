import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/common/theme_extension';

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
        color: context.colors.surface.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.colors.surface.withValues(alpha: 0.12),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: (url.isEmpty)
          ?  Icon(Icons.cloud, color: context.colors.surface, size: 40)
          : Lottie.asset(
              'assets/animated/${url.toLowerCase()}.json',
              repeat: true,
            ),
    );
  }
}
