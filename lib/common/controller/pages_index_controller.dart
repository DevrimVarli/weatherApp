import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pages_index_controller.g.dart';

@Riverpod(keepAlive: true)
class PagesIndex extends _$PagesIndex {
  @override
  int build() {
    return 0;
  }

  // ignore: use_setters_to_change_properties
  void setIndex(int newIndex) {
    state = newIndex;
  }
}
