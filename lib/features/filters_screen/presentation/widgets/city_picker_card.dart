import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/filters_screen/controller/city_controller.dart';

class CityPickerCard extends ConsumerWidget {
  const CityPickerCard({super.key, required this.cities2});
  final List<String> cities2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // mevcut seçili şehir (örnek: cityControllerProvider’dan okuyoruz)
    final selectedCity = ref.watch(cityControllerProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.06),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // hafif gradient arkaplan
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0x1A7E57C2), Color(0x1A5E35B1)],
            ),
            border: Border.all(color: Colors.white.withOpacity(0.10)),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Başlık satırı
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5B3FC4).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.location_city_rounded,
                      color: Color(0xFF5B3FC4),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'city_select_title'.tr(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'city_select_hint'.tr(),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.85),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Dropdown alanı
              DropdownButtonFormField<String>(
                value: cities2.contains(selectedCity) ? selectedCity : null,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF5B3FC4),
                ),
                dropdownColor: const Color(0xFF141321),
                elevation: 8,
                style: const TextStyle(fontSize: 15, color: Colors.white),

                decoration: InputDecoration(
                  labelText: 'city_field_label'.tr(),
                  prefixIcon: const Icon(
                    Icons.location_on_rounded,
                    color: Color(0xFF5B3FC4),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.07),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.18),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF5B3FC4),
                      width: 1.8,
                    ),
                  ),
                  helperText: ' ', // form yüksekliğini dengeler
                  helperStyle: const TextStyle(height: 0.8),
                ),

                menuMaxHeight: 320,

                items: cities2.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: Colors.white70,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            value,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),

                onChanged: (val) {
                  if (val != null) {
                    ref.read(cityControllerProvider.notifier).updateCity(val);
                  }
                },
              ),

              // Alt satır: seçili şehir rozeti
              const SizedBox(height: 8),
              if (selectedCity.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5B3FC4).withOpacity(0.18),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF5B3FC4).withOpacity(0.35),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.check_circle_rounded,
                        size: 16,
                        color: Color(0xFFB7A9FF),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'weather_header_city_country'.tr(
                          namedArgs: {
                            'city': selectedCity,
                            // TR sabit ülke metni JSON içinde: "{city}, Türkiye"
                          },
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
