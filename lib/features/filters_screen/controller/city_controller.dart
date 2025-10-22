import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'city_controller.g.dart';

@Riverpod(keepAlive: true)
class CityController extends _$CityController {
  @override
  String build() {
    return '';
  }

  void updateCity(String newCity) {
    state = newCity;
  }
}
