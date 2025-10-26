import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/home_screen/domain/weather_model.dart';

part 'weather_data_repository.g.dart';

@riverpod
Future<List<WeatherModel>> weatherDataRepository(Ref ref, String city) async {
  Dio dio = Dio();

  Response<dynamic> response = await dio.get(
    'https://api.collectapi.com/weather/getWeather?lang=tr&city=$city',
    options: Options(
      headers: <String, dynamic>{
        'authorization': 'apikey 31QfpYJrZQMyc1DDy2yP2T:5F5a6rC1re42ZICQOrQo8Y',
        'content-type': 'application/json',
      },
      validateStatus: (int? s) => s != null && s < 500,
    ),
  );

  if (response.statusCode == 200) {
    dynamic body = response.data;

    if (body is List) {
      return body
          .map((dynamic e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (body is Map<String, dynamic> && body['result'] is List) {
      List<dynamic> list = body['result'] as List<dynamic>;
      return list
          .map((dynamic e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('error_unexpected_format'.tr());
    }
  } else if (response.statusCode == 401 || response.statusCode == 403) {
    throw Exception('error_unauthorized'.tr());
  } else {
    throw Exception(
      'error_request_failed'.tr(
        namedArgs: <String, String>{
          'statusCode': response.statusCode.toString(),
        },
      ),
    );
  }
}
