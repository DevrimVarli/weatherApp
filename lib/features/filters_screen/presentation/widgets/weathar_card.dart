import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/filters_screen/presentation/widgets/codition_fill.dart';
import 'package:weather_app/features/filters_screen/presentation/widgets/mini_chip.dart';
import 'package:weather_app/features/filters_screen/presentation/widgets/weather_icon.dart';
import 'package:weather_app/features/home_screen/controller/location_controller.dart';
import 'package:weather_app/features/home_screen/domain/location_model.dart';
import 'package:weather_app/features/home_screen/domain/weather_model.dart';

/// ——— hava durumu kartı ———
class WeatherCard extends ConsumerWidget {
  const WeatherCard({super.key, required this.weather, required this.degree});

  final WeatherModel weather;
  final double degree;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LocationModel location = ref.watch(locationControllerProvider);

    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        children: <Widget>[
          // cam efekti arka plan
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.white.withValues(alpha: 0.08),
                  Colors.white.withValues(alpha: 0.04),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
              borderRadius: BorderRadius.circular(28),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
          ),
          // blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              padding: const EdgeInsets.all(18),
              height: 190,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // dereceler + ikon
                  Row(
                    children: <Widget>[
                      Text(
                        '${degree.toStringAsFixed(0)}°',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 12),
                      ConditionPill(text: weather.description),
                      const Spacer(),
                      WeatherIcon(url: weather.status.toString()),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // şehir/ülke
                  Text(
                    '${location.cityName}, ${location.countryName}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  // min/max chip’leri
                  Row(
                    children: <Widget>[
                      MiniChip(
                        label: 'weather_max_label'.tr(),
                        value: '${weather.max}°',
                        icon: Icons.arrow_upward_rounded,
                      ),
                      const SizedBox(width: 10),
                      MiniChip(
                        label: 'weather_min_label'.tr(),
                        value: '${weather.min}°',
                        icon: Icons.arrow_downward_rounded,
                      ),
                      const Spacer(),
                      // tarih/saat varsa kısa info gösterebilirsin (opsiyonel)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
