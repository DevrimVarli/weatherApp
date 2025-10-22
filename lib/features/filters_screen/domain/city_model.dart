import 'package:freezed_annotation/freezed_annotation.dart';
part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    required int id,
    required String name,
    int? population,
    int? area,
    double? altitude,
    bool? isCoastal,
    bool? isMetropolitan,
    Map<String, dynamic>? region,
    Map<String, dynamic>? coordinates,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
