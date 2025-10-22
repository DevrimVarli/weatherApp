import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/home_screen/controller/location_controller.dart';
import 'package:weather_app/features/home_screen/data/location_service.dart';
import 'package:weather_app/features/home_screen/domain/location_model.dart';
part 'fetch_on_open.g.dart';
@riverpod
Future<void> fetchOnOpen(Ref ref) async {
  try {
    LocationInfo result = await LocationService.fetchCityCountryOnStartup();
    double lat =result.position.latitude;
    double lng =result.position.longitude;
    String city=result.city.isNotEmpty?result.city:'city_selected_fallback'.tr();
    String country=result.country.isNotEmpty?result.country:'';
    ref.read(locationControllerProvider.notifier).updateLocation(
      LocationModel(
        cityName: city,
        countryName: country,
        latitude: lat,
        longitude: lng,
      ),
    );


  } catch (e) {
    ref.read(locationControllerProvider.notifier).updateLocation(
      LocationModel(
        cityName: 'city_cannot_get'.tr(),
        countryName: '',
        latitude: 0,
        longitude: 0,
      ),
    );
  }
}
