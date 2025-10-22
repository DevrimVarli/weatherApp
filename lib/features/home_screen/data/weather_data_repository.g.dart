// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherDataRepositoryHash() =>
    r'79b395f438c4c238fb2b3b5d7b6216d7632dc4a6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [weatherDataRepository].
@ProviderFor(weatherDataRepository)
const weatherDataRepositoryProvider = WeatherDataRepositoryFamily();

/// See also [weatherDataRepository].
class WeatherDataRepositoryFamily
    extends Family<AsyncValue<List<WeatherModel>>> {
  /// See also [weatherDataRepository].
  const WeatherDataRepositoryFamily();

  /// See also [weatherDataRepository].
  WeatherDataRepositoryProvider call(String city) {
    return WeatherDataRepositoryProvider(city);
  }

  @override
  WeatherDataRepositoryProvider getProviderOverride(
    covariant WeatherDataRepositoryProvider provider,
  ) {
    return call(provider.city);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weatherDataRepositoryProvider';
}

/// See also [weatherDataRepository].
class WeatherDataRepositoryProvider
    extends AutoDisposeFutureProvider<List<WeatherModel>> {
  /// See also [weatherDataRepository].
  WeatherDataRepositoryProvider(String city)
    : this._internal(
        (ref) => weatherDataRepository(ref as WeatherDataRepositoryRef, city),
        from: weatherDataRepositoryProvider,
        name: r'weatherDataRepositoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$weatherDataRepositoryHash,
        dependencies: WeatherDataRepositoryFamily._dependencies,
        allTransitiveDependencies:
            WeatherDataRepositoryFamily._allTransitiveDependencies,
        city: city,
      );

  WeatherDataRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.city,
  }) : super.internal();

  final String city;

  @override
  Override overrideWith(
    FutureOr<List<WeatherModel>> Function(WeatherDataRepositoryRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WeatherDataRepositoryProvider._internal(
        (ref) => create(ref as WeatherDataRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        city: city,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<WeatherModel>> createElement() {
    return _WeatherDataRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherDataRepositoryProvider && other.city == city;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, city.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WeatherDataRepositoryRef
    on AutoDisposeFutureProviderRef<List<WeatherModel>> {
  /// The parameter `city` of this provider.
  String get city;
}

class _WeatherDataRepositoryProviderElement
    extends AutoDisposeFutureProviderElement<List<WeatherModel>>
    with WeatherDataRepositoryRef {
  _WeatherDataRepositoryProviderElement(super.provider);

  @override
  String get city => (origin as WeatherDataRepositoryProvider).city;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
