import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/theme_extension';
import 'package:weather_app/features/home_screen/controller/fetch_on_open.dart';
import 'package:weather_app/features/home_screen/controller/location_controller.dart';
import 'package:weather_app/features/home_screen/data/weather_data_repository.dart';
import 'package:weather_app/features/home_screen/domain/location_model.dart';
import 'package:weather_app/features/home_screen/domain/weather_model.dart';
import 'package:weather_app/utils/normalize_city_name.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    ref.watch(fetchOnOpenProvider);
    LocationModel location = ref.watch(locationControllerProvider);
    if (location.cityName == 'city_selected_fallback'.tr()) {
      return Scaffold(
        backgroundColor: context.colors.onSurface,
        body: Center(
          child: CircularProgressIndicator(color: context.colors.surface),
        ),
      );
    }
    String city = normalizeCityName(location.cityName);

    AsyncValue<List<WeatherModel>> weatherAsyncValue = ref.watch(
      weatherDataRepositoryProvider(city),
    );

    return Scaffold(
      backgroundColor: context.colors.onSurface, // Yedek koyu arka plan
      body: weatherAsyncValue.when(
        data: (List<WeatherModel> data) {
          WeatherModel weather = data[0];
          double degree = double.parse(weather.degree);

          return Container(
            margin: const EdgeInsets.only(bottom: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/img/${weather.status.toString().toLowerCase()}.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: ColoredBox(
              // Şeffaf siyah katman: metinlerin daha belirgin olması için
              color: Colors.black54,
              child: Center(
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Text(
                      'weather_header_city_country'.tr(
                        namedArgs: <String, String>{'city': location.cityName},
                      ),
                      style: textTheme.headlineMedium?.copyWith(
                        color: colorScheme.surface,
                      ),
                    ),
                    Text(
                      '${degree.toStringAsFixed(0)}°',
                      style: textTheme.displayLarge?.copyWith(
                        color: colorScheme.surface,
                      ),
                    ),
                    Text(
                      weather.description.toUpperCase(),
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.surface,
                      ),
                    ),
                    Text(
                      'weather_range'.tr(
                        namedArgs: <String, String>{
                          'max': weather.max,
                          'min': weather.min,
                        },
                      ),
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.surface,
                      ),
                    ),
                    Image.asset(
                      'assets/img/house_${weather.status.toString().toLowerCase()}.png',
                      height: 320,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        error: (Object error, StackTrace stack) => Center(
          child: Text(
            'error_generic'.tr(
              namedArgs: <String, String>{'error': error.toString()},
            ),
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.surface),
          ),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(color: colorScheme.surface),
        ),
      ),
    );
  }
}
