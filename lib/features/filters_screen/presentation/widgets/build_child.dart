import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/theme_extension';
import 'package:weather_app/features/filters_screen/controller/city_controller.dart';
import 'package:weather_app/features/filters_screen/domain/city_model.dart';
import 'package:weather_app/features/home_screen/controller/location_controller.dart';
import 'package:weather_app/features/home_screen/domain/location_model.dart';

class BuildChild extends ConsumerWidget {
  const BuildChild({super.key, required this.cities});
  final List<CityModel> cities;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    List<String> cities2 = cities.map((CityModel city) => city.name).toList();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // İçeriği minimum boyutta tutar
          children: <Widget>[
            // Başlık Bölümü
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'city_select_title'.tr(),
                  style: textTheme.titleLarge?.copyWith(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    Navigator.of(context).pop(); // Kapatma butonu
                  },
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
              color: Colors.grey,
            ), // Başlık ile içerik arasına ayırıcı
            const SizedBox(height: 10),

            // Açıklama Metni
            Text(
              'city_select_hint'.tr(),
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.85),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // DropdownButtonFormField ile şehir seçimi
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'city_field_label'.tr(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                filled: true,
                fillColor: Colors.deepPurple.withValues(alpha: 0.05),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
              ),
              initialValue: cities[0].name,

              items: cities2.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                ref.read(cityControllerProvider.notifier).updateCity(newValue!);
              },
              borderRadius: BorderRadius.circular(16),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
              dropdownColor: context.colors.surface,
              elevation: 15,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 30),

            // Aksiyon Butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey.shade700,
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'city_cancel'.tr(),
                      style: textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      String city = ref.read(cityControllerProvider);
                      CityModel c = cities.firstWhere(
                        (CityModel elemen) => elemen.name == city,
                      );
                      ref
                          .read(locationControllerProvider.notifier)
                          .updateLocation(
                            LocationModel(
                              cityName: city,
                              countryName: 'Türkiye',
                              latitude: c.coordinates!['latitude'] as double,
                              longitude: c.coordinates!['latitude'] as double,
                            ),
                          );
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, // Arka plan rengi
                      foregroundColor: context.colors.surface, // Yazı rengi
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 4,
                    ),
                    child: Text(
                      'city_select_button'.tr(),
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.surface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
