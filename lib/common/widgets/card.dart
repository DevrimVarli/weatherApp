import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/common/controller/select_day_weather.dart';
import 'package:weather_app/common/theme_extension';
import 'package:weather_app/common/widgets/detail_card.dart';
import 'package:weather_app/features/home_screen/controller/location_controller.dart';
import 'package:weather_app/features/home_screen/data/weather_data_repository.dart';
import 'package:weather_app/features/home_screen/domain/location_model.dart';
import 'package:weather_app/features/home_screen/domain/weather_model.dart';
import 'package:weather_app/utils/normalize_city_name.dart';

class CardWidget extends ConsumerStatefulWidget {
  const CardWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends ConsumerState<CardWidget> {
  Color getColor(WeatherModel weatherModel, WeatherModel selectWeatherModel) {
    if (selectWeatherModel.date.isNotEmpty) {
      if (selectWeatherModel.date.substring(3, 5) ==
          weatherModel.date.substring(3, 5)) {
        return HexColor('#48319D');
      }
    } else if (DateTime.now().day.toString() ==
        weatherModel.date.substring(3, 5)) {
      return HexColor('#48319D');
    }

    return HexColor('#48319D').withValues(alpha: 0.4);
  }

  @override
  Widget build(BuildContext context) {
    LocationModel location = ref.watch(locationControllerProvider);
    String city = normalizeCityName(location.cityName);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    WeatherModel model = ref.watch(selectDayWeatherProvider);

    AsyncValue<List<WeatherModel>> weatherAsyncValue = ref.watch(
      weatherDataRepositoryProvider(city),
    );
    return weatherAsyncValue.when(
      data: (List<WeatherModel> data) {
        if (data.isEmpty) {
          return Center(
            child: Text(
              'weather.no_data'.tr(),
              style: TextStyle(color: colorScheme.surface),
            ),
          );
        }
        WeatherModel weatherToday = data[0];
        return DraggableScrollableSheet(
          initialChildSize: 0.3, // ilk açıldığında yüksekliği (ekranın %30’u)
          minChildSize: 0.2, // en küçük hali (yani en aşağı inebileceği nokta)
          maxChildSize: 0.8, // en büyük hali (yukarı çekilince ekranın %80’i)
          builder: (BuildContext context, ScrollController scrollController) {
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    HexColor('2E335A'),
                    HexColor('2E335A').withValues(alpha: 0.5),
                  ],
                ),

                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 12,
                    color: context.colors.onSurface.withValues(alpha: 0.2),
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: ListView(
                controller:
                    scrollController, // DraggableScrollableSheet'in verdiği controller SADECE dış listeye
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (BuildContext context, int index) {
                        WeatherModel weather = data[index];
                        String degree = double.parse(
                          weather.degree,
                        ).toStringAsFixed(0);
                        return GestureDetector(
                          onTap: () {
                            ref
                                .read(selectDayWeatherProvider.notifier)
                                .switcWeatherModel(weather);
                          },
                          child: Container(
                            width: 54,
                            margin: const EdgeInsets.only(right: 12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: getColor(weather, model),
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: context.colors.surface.withValues(
                                  alpha: 0.4,
                                ),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    weather.day.substring(0, 3),
                                    style: textTheme.bodyLarge?.copyWith(
                                      color: colorScheme.surface,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Lottie.asset(
                                    'assets/animated/${weather.status.toString().toLowerCase()}.json',
                                    width: 50,
                                    height: 50,
                                    repeat: true,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '$degree°',
                                    style: textTheme.titleMedium?.copyWith(
                                      color: colorScheme.surface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  DetailCard(
                    weatherModel: model.date.isEmpty ? weatherToday : model,
                  ),
                ],
              ),
            );
          },
        );
      },
      error: (Object error, StackTrace stack) {
        return const CircularProgressIndicator();
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
