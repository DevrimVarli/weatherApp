import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.freezed.dart';
part 'weather_model.g.dart';
@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String date,
    required String day,
    required String description,
    required String degree,
    required String min,
    required String max,
    required String night,
    required String humidity,
    String? icon,
    String? status,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
