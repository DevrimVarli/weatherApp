import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/filters_screen/presentation/widgets/city_choose_alert.dart';

// Ekranın üst kısmındaki şehir ve ülke bilgisini gösteren bileşen
class HeaderCityRow extends StatelessWidget {
  const HeaderCityRow({super.key, required this.city, required this.country});

  final String city;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // metinler
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$city, $country',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'today_summary'.tr(),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withValues(alpha: 0.12),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            onPressed: () {
              showDialog(
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
