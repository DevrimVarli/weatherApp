import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'is_card_visible.g.dart';

@riverpod
class IsCardVisible extends _$IsCardVisible {
  @override
  bool build() {
    return false;
  }

  void switchVisibility(bool isVisible) {
    state = isVisible;
  }
}
