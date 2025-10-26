import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/filters_screen/data/get_city_data.dart';
import 'package:weather_app/features/filters_screen/domain/city_model.dart';
import 'package:weather_app/features/filters_screen/presentation/widgets/build_child.dart';

class CityChooseAlert extends ConsumerStatefulWidget {
  const CityChooseAlert({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CityChooseAlertState();
}

class _CityChooseAlertState extends ConsumerState<CityChooseAlert> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    AsyncValue<List<CityModel>> cityAsyncValue = ref.watch(getCityDataProvider);
    return AlertDialog(
      // AlertDialog yerine Dialog kullanmak, içeriği daha serbest kontrol etmemizi sağlar
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: cityAsyncValue.when(
        data: (List<CityModel> cities) {
          if (cities.isEmpty) {
            return Text(
              'city_not_found'.tr(),
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
              ),
            );
          }

          return BuildChild(cities: cities);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object err, StackTrace stack) => Center(
          child: Text(
            'error_generic'.tr(
              namedArgs: <String, String>{'err': err.toString()},
            ),
            style: TextStyle(color: colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
