import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/filters_screen/presentation/widgets/error_screen.dart';
import 'package:weather_app/features/filters_screen/presentation/widgets/header_city_row.dart';
import 'package:weather_app/features/filters_screen/presentation/widgets/skeleton_list.dart';
import 'package:weather_app/features/filters_screen/presentation/widgets/weathar_card.dart';
import 'package:weather_app/features/home_screen/controller/location_controller.dart';
import 'package:weather_app/features/home_screen/data/weather_data_repository.dart';
import 'package:weather_app/features/home_screen/domain/location_model.dart';
import 'package:weather_app/features/home_screen/domain/weather_model.dart';
import 'package:weather_app/utils/background_gradient_for_temp.dart';
import 'package:weather_app/utils/normalize_city_name.dart';
import 'package:weather_app/utils/parse_degre_safe.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    LocationModel location = ref.watch(locationControllerProvider);
    String city = normalizeCityName(location.cityName);

    AsyncValue<List<WeatherModel>> weatherAsyncValue = ref.watch(
      weatherDataRepositoryProvider(city),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Hava Durumu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: .4,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: weatherAsyncValue.when(
        data: (List<WeatherModel> data) {
          // arka plan gradyanı için ilk öğenin sıcaklığına bak
          double firstDegree = parseDegreeSafe(
            data.isNotEmpty ? data[0].degree : '20',
          );
          List<Color> bg = backgroundGradientForTemp(firstDegree);

          return DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: bg,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  // üstte şehir-ülke + durum animasyonu
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    child: HeaderCityRow(
                      city: location.cityName,
                      country: location.countryName,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
                      itemCount: data.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 14),
                      itemBuilder: (BuildContext context, int index) {
                        WeatherModel weather = data[index];
                        double degree = parseDegreeSafe(weather.degree);
                        return WeatherCard(weather: weather, degree: degree);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (Object error, StackTrace stackTrace) {
          return ErrorState(
            message: 'error_data_load'.tr(
              namedArgs: <String, String>{'error': error.toString()},
            ),
            onRetry: () =>
                ref.refresh(weatherDataRepositoryProvider(location.cityName)),
          );
        },
        loading: () => const SkeletonList(),
      ),
    );
  }
}
