import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'is_card_visible.g.dart';

@riverpod
class IsCardVisible extends _$IsCardVisible {
  @override
  bool build() {
    return false;
  }

  // ignore: avoid_positional_boolean_parameters, use_setters_to_change_properties
  void switchVisibility(bool isVisible) {
    state = isVisible;
  }
}
