import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/theme_extension';
import 'package:weather_app/features/filters_screen/presentation/widgets/city_choose_alert.dart';

// Ekranın üst kısmındaki şehir ve ülke bilgisini gösteren bileşen
class HeaderCityRow extends StatelessWidget {
  const HeaderCityRow({super.key, required this.city, required this.country});

  final String city;
  final String country;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: <Widget>[
        // metinler
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$city, $country',
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.surface,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'today_summary'.tr(),
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.surface.withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.surface.withValues(alpha: 0.12),
              foregroundColor: context.colors.surface,
              elevation: 0,
            ),
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) => CityChooseAlert(),
              );
            },
            child: Text('city_change'.tr()),
          ),
        ),

        // lottie (duruma göre)
      ],
    );
  }
}
