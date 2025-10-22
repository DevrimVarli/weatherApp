import 'dart:ui';
import 'package:hexcolor/hexcolor.dart';
List<Color> backgroundGradientForTemp(double t) {
  // soğuk → sıcak gradyan
  if (t <= 0) {
    return <Color>[const Color(0xFF0F2027), const Color(0xFF203A43)];
  } else if (t < 15) {
    return <Color>[HexColor('#2E335A'), HexColor('#1C1B33')];
  } else if (t < 28) {
    return <Color>[const Color(0xFF2b5876), const Color(0xFF4e4376)];
  } else {
    return <Color>[const Color(0xFF614385), const Color(0xFF516395)];
  }
}
