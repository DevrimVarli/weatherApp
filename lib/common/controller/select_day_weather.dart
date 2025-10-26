import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/home_screen/domain/weather_model.dart';
part 'select_day_weather.g.dart';
@Riverpod(keepAlive: true)
class SelectDayWeather extends _$SelectDayWeather {
  @override
  WeatherModel build() {
    return WeatherModel(
      date: '',
      day: '',
      description: '',
      degree: '',
      min: '',
      max: '',
      night: '',
      humidity: '',
    );
  }

  // ignore: use_setters_to_change_properties
  void switcWeatherModel(WeatherModel weatherModel) {
    state = weatherModel;
  }
}
