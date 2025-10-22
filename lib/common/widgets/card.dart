import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/features/home_screen/controller/location_controller.dart';
import 'package:weather_app/features/home_screen/data/weather_data_repository.dart';
import 'package:weather_app/features/home_screen/domain/location_model.dart';
import 'package:weather_app/features/home_screen/domain/weather_model.dart';
import 'package:weather_app/utils/normalize_city_name.dart';
import 'package:weather_app/utils/to_string_as_fixed.dart';

class CardWidget extends ConsumerStatefulWidget {
  const CardWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends ConsumerState<CardWidget> {
  Color getColor(int day) {
    if (DateTime.now().day == day) {
      return HexColor('#48319D');
    }
    return HexColor('#48319D').withValues(alpha: 0.4);
  }

  @override
  Widget build(BuildContext context) {
    LocationModel location = ref.watch(locationControllerProvider);
    String city = normalizeCityName(location.cityName);

    AsyncValue<List<WeatherModel>> weatherAsyncValue = ref.watch(
      weatherDataRepositoryProvider(city),
    );
    return weatherAsyncValue.when(
      data: (List<WeatherModel> data) {
        if (data.isEmpty) {
          return  Center(
            child: Text(
              'weather.no_data'.tr(),
              style: TextStyle(color: Colors.white),
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
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    blurRadius: 12,
                    color: Colors.black26,
                    offset: Offset(0, -4),
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
                        return Container(
                          width: 54,
                          margin: const EdgeInsets.only(right: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: getColor(
                              int.parse(weather.date.substring(3, 5)),
                            ),
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  weather.day.substring(0, 3),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
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
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: <Color>[
                          HexColor('#48319D').withValues(alpha: 0.85),
                          HexColor('#2E335A').withValues(alpha: 0.85),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                        width: 1.2,
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${weatherToday.day} • ${weatherToday.date}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),

                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Lottie.asset(
                              'assets/animated/${weatherToday.status.toString().toLowerCase()}.json',
                              width: 100,
                              height: 100,
                              repeat: true,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              weatherToday.description[0].toUpperCase() +
                                  weatherToday.description.substring(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // 🔹 Ana sıcaklık + min/max göstergesi
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  colors: <Color>[
                                    Colors.white,
                                    Colors.lightBlueAccent,
                                  ],
                                ).createShader(bounds);
                              },
                              child: Text(
                                '${double.parse(weatherToday.degree).toStringAsFixed(1)}°',
                                style: const TextStyle(
                                  fontSize: 64,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'weather_arrow_max'.tr(
                                    namedArgs: <String, String>{'max': toStringAsFixed(weatherToday.max, 0)}
                                  ),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                                 Text(
                                  'weather_arrow_min'.tr(
                                    namedArgs: <String, String>{'min': toStringAsFixed(weatherToday.min, 0)}
                                  ),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Ek bilgiler (gece sıcaklığı, nem)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white24),
                              ),
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.nights_stay,
                                    color: Colors.white70,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'weather_night_temp'.tr(
                                      namedArgs: <String, String>{
                                        'night': toStringAsFixed(
                                          weatherToday.night,
                                          1,
                                        ),
                                      },
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white24),
                              ),
                              child: Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.water_drop,
                                    color: Colors.white70,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'weather_humidity'.tr(
                                      namedArgs: <String, String>{
                                        'humidity': weatherToday.humidity,
                                      },
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // 🔹 Alt açıklama metni (dinamik, orta hizalı)
                        Text(
                          'weather_message'.tr(
                            namedArgs: <String, String>{
                              'description': weatherToday.description,
                              'humidity': weatherToday.humidity,
                              'degree': weatherToday.degree,
                            },
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 2,
                          width: 100,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.white.withValues(alpha: 0.8),
                                Colors.blueAccent.withValues(alpha: 0.4),
                                Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
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
