import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/home_screen/domain/location_model.dart';
part 'location_controller.g.dart';
@Riverpod(keepAlive: true)
class LocationController extends _$LocationController {
  @override
  LocationModel build() {
    return LocationModel(
      cityName: 'city_selected_fallback'.tr(),
      countryName: 'countryName',
      latitude: 0,
      longitude: 0,
    );
  }
  void updateLocation(LocationModel newLocation) {
    state = newLocation;
  }
}
