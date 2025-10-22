import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/// Dışarıya döneceğimiz veri tipi (Dart record için takma ad)
typedef LocationInfo = ({
  Position position,
  String city,
  String country,
  String countryCode,
});

class LocationService {
  /// Uygulama açılışında tek çağrı: izinleri kontrol eder, konumu alır,
  /// ters geocode yapar ve şehir/ülke bilgisini döndürür.
  static Future<LocationInfo> fetchCityCountryOnStartup() async {
    await _ensureServiceAndPermission();

    Position position = await _getBestPosition();
    Placemark placemark = await _getFirstPlacemark(position);

    String city = _extractCity(placemark);
    String country = (placemark.country ?? '').trim();
    String countryCode = (placemark.isoCountryCode ?? '').trim();

    return (
      position: position,
      city: city,
      country: country,
      countryCode: countryCode,
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────

  /// Konum servisi açık mı ve izinler var mı? Gerekirse kullanıcıdan ister.
  static Future<void> _ensureServiceAndPermission() async {
    // Servis açık mı?
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      throw Exception('Konum servisi kapalı.');
    }

    // İzinler
    LocationPermission perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied) {
      perm = await Geolocator.requestPermission();
    }
    if (perm == LocationPermission.denied) {
      throw Exception('Konum izni reddedildi.');
    }
    if (perm == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      throw Exception('Konum izni kalıcı olarak reddedildi.');
    }
  }

  /// En iyi mevcut konumu döndürür. Gerekirse last known’a düşer.
  static Future<Position> _getBestPosition() async {
    try {
      return await Geolocator.getCurrentPosition(
        
      );
    } catch (_) {
      Position? last = await Geolocator.getLastKnownPosition();
      if (last != null) return last;
      rethrow;
    }
  }

  /// Koordinatlardan ilk Placemark’ı döndürür.
  static Future<Placemark> _getFirstPlacemark(Position pos) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    if (placemarks.isEmpty) {
      // Placemark hiç yoksa boş bir Placemark dönmek yerine hata fırlatalım.
      throw Exception('Adres bulunamadı.');
    }
    return placemarks.first;
  }

  /// Şehir (il) bilgisini güvenli biçimde çıkarır.
  /// TR’de genellikle il = `administrativeArea`.
  /// Diğer ülkeler için locality daha anlamlı olabilir, ama genel fallback sırası:
  /// administrativeArea → locality → subAdministrativeArea
  static String _extractCity(Placemark p) {
    String pickAdminArea() => (p.administrativeArea ?? '').trim();
    String pickLocality() => (p.locality ?? '').trim();
    String pickSubAdmin() => (p.subAdministrativeArea ?? '').trim();

    String iso = (p.isoCountryCode ?? '').toUpperCase();

    // Türkiye için il (administrativeArea) öncelikli
    if (iso == 'TR') {
      return pickAdminArea().isNotEmpty
          ? pickAdminArea()
          : (pickLocality().isNotEmpty
              ? pickLocality()
              : pickSubAdmin());
    }

    // Diğer ülkeler için makul sıra
    return pickLocality().isNotEmpty
        ? pickLocality()
        : (pickAdminArea().isNotEmpty
            ? pickAdminArea()
            : pickSubAdmin());
  }
}
