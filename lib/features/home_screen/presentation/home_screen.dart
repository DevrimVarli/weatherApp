import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    ref.watch(fetchOnOpenProvider);
    LocationModel location = ref.watch(locationControllerProvider);
    if (location.cityName == 'city_selected_fallback'.tr()) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }
    String city = normalizeCityName(location.cityName);

    AsyncValue<List<WeatherModel>> weatherAsyncValue = ref.watch(
      weatherDataRepositoryProvider(city),
    );

    return Scaffold(
      backgroundColor: Colors.black, // Yedek koyu arka plan
      body: weatherAsyncValue.when(
        data: (List<WeatherModel> data) {
          WeatherModel weather = data[0];
          print(weather.status);
          double degree = double.parse(weather.degree);

          return Container(
            margin: const EdgeInsets.only(bottom: 60),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(height: 50),
                    Text(
                      'weather_header_city_country'.tr(
                        namedArgs: <String, String>{'city': location.cityName},
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(blurRadius: 6, color: Colors.black54),
                        ],
                      ),
                    ),
                    Text(
                      '${degree.toStringAsFixed(0)}°',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 72,
                        fontWeight: FontWeight.w600,
                        shadows: <Shadow>[
                          Shadow(blurRadius: 8, color: Colors.black54),
                        ],
                      ),
                    ),
                    Text(
                      weather.description.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        shadows: <Shadow>[
                          Shadow(blurRadius: 5, color: Colors.black87),
                        ],
                      ),
                    ),
                    Text(
                      'weather_range'.tr(
                        namedArgs: <String, String>{
                          'max': weather.max,
                          'min': weather.min,
                        },
                      ),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 22,
                        shadows: <Shadow>[
                          Shadow(blurRadius: 4, color: Colors.black54),
                        ],
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
            style: const TextStyle(color: Colors.redAccent),
          ),
        ),
        loading: () =>
            const Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
