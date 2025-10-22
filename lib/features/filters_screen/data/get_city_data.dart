import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/filters_screen/domain/city_model.dart';

part 'get_city_data.g.dart';

@riverpod
Future<List<CityModel>> getCityData(Ref ref) async {
  Dio dio = Dio();
  Response<dynamic> response = await dio.get('https://api.turkiyeapi.dev/v1/provinces');

  if (response.statusCode == 200) {
    Map<String, dynamic> data = response.data as Map<String, dynamic>;   // önce Map'e cast et
    List<dynamic> result = data['data'] as List<dynamic>;                  // sonra listeyi al
    return result.map((dynamic e) => CityModel.fromJson(e as Map<String,dynamic>)).toList();
  } else {
    throw Exception('Beklenmeyen veri formatı: ${response.statusCode}');
  }
}
