import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/common/theme_extension';
import 'package:weather_app/features/home_screen/domain/weather_model.dart';
import 'package:weather_app/utils/to_string_as_fixed.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({super.key,required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    ColorScheme colorScheme=Theme.of(context).colorScheme;
    return Container(
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
                          color: context.colors.onSurface.withValues(
                            alpha: 0.3,
                          ),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                      border: Border.all(
                        color: context.colors.surface.withValues(alpha: 0.1),
                        width: 1.2,
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${weatherModel.day} • ${weatherModel.date}',
                          style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.surface,
                            letterSpacing: 1.2,
                          ),
                        ),

                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Lottie.asset(
                              'assets/animated/${weatherModel.status.toString().toLowerCase()}.json',
                              width: 100,
                              height: 100,
                              repeat: true,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              weatherModel.description[0].toUpperCase() +
                                  weatherModel.description.substring(1),
                              style: textTheme.headlineSmall?.copyWith(
                                color: colorScheme.surface,
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
                                return LinearGradient(
                                  colors: <Color>[
                                    context.colors.surface,
                                    Colors.lightBlueAccent,
                                  ],
                                ).createShader(bounds);
                              },
                              child: Text(
                                '${double.parse(weatherModel.degree).toStringAsFixed(1)}°',
                                style: textTheme.displayLarge?.copyWith(
                                  color: colorScheme.surface,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'weather_arrow_max'.tr(
                                    namedArgs: <String, String>{
                                      'max': toStringAsFixed(
                                        weatherModel.max,
                                        0,
                                      ),
                                    },
                                  ),
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.surface,
                                  ),
                                ),
                                Text(
                                  'weather_arrow_min'.tr(
                                    namedArgs: <String, String>{
                                      'min': toStringAsFixed(
                                        weatherModel .min,
                                        0,
                                      ),
                                    },
                                  ),
                                  style: textTheme.bodyLarge?.copyWith(
                                    color: colorScheme.surface,
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
                                color: context.colors.surface.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: context.colors.surface,
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.nights_stay,
                                    color: context.colors.surface,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'weather_night_temp'.tr(
                                      namedArgs: <String, String>{
                                        'night': toStringAsFixed(
                                          weatherModel.night,
                                          1,
                                        ),
                                      },
                                    ),
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.surface,
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
                                color: context.colors.surface.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: context.colors.surface,
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.water_drop,
                                    color: context.colors.surface,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'weather_humidity'.tr(
                                      namedArgs: <String, String>{
                                        'humidity': weatherModel.humidity,
                                      },
                                    ),
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.surface,
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
                              'description': weatherModel.description,
                              'humidity': weatherModel.humidity,
                              'degree': weatherModel.degree,
                            },
                          ),
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.surface.withValues(alpha: 0.8),
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
                                context.colors.surface.withValues(alpha: 0.8),
                                Colors.blueAccent.withValues(alpha: 0.4),
                                Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  );
  }
}
