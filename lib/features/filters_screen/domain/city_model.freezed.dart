// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return _CityModel.fromJson(json);
}

/// @nodoc
mixin _$CityModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get population => throw _privateConstructorUsedError;
  int? get area => throw _privateConstructorUsedError;
  double? get altitude => throw _privateConstructorUsedError;
  bool? get isCoastal => throw _privateConstructorUsedError;
  bool? get isMetropolitan => throw _privateConstructorUsedError;
  Map<String, dynamic>? get region => throw _privateConstructorUsedError;
  Map<String, dynamic>? get coordinates => throw _privateConstructorUsedError;

  /// Serializes this CityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityModelCopyWith<CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityModelCopyWith<$Res> {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) then) =
      _$CityModelCopyWithImpl<$Res, CityModel>;
  @useResult
  $Res call({
    int id,
    String name,
    int? population,
    int? area,
    double? altitude,
    bool? isCoastal,
    bool? isMetropolitan,
    Map<String, dynamic>? region,
    Map<String, dynamic>? coordinates,
  });
}

/// @nodoc
class _$CityModelCopyWithImpl<$Res, $Val extends CityModel>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? population = freezed,
    Object? area = freezed,
    Object? altitude = freezed,
    Object? isCoastal = freezed,
    Object? isMetropolitan = freezed,
    Object? region = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            population: freezed == population
                ? _value.population
                : population // ignore: cast_nullable_to_non_nullable
                      as int?,
            area: freezed == area
                ? _value.area
                : area // ignore: cast_nullable_to_non_nullable
                      as int?,
            altitude: freezed == altitude
                ? _value.altitude
                : altitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            isCoastal: freezed == isCoastal
                ? _value.isCoastal
                : isCoastal // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isMetropolitan: freezed == isMetropolitan
                ? _value.isMetropolitan
                : isMetropolitan // ignore: cast_nullable_to_non_nullable
                      as bool?,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            coordinates: freezed == coordinates
                ? _value.coordinates
                : coordinates // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CityModelImplCopyWith<$Res>
    implements $CityModelCopyWith<$Res> {
  factory _$$CityModelImplCopyWith(
    _$CityModelImpl value,
    $Res Function(_$CityModelImpl) then,
  ) = __$$CityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    int? population,
    int? area,
    double? altitude,
    bool? isCoastal,
    bool? isMetropolitan,
    Map<String, dynamic>? region,
    Map<String, dynamic>? coordinates,
  });
}

/// @nodoc
class __$$CityModelImplCopyWithImpl<$Res>
    extends _$CityModelCopyWithImpl<$Res, _$CityModelImpl>
    implements _$$CityModelImplCopyWith<$Res> {
  __$$CityModelImplCopyWithImpl(
    _$CityModelImpl _value,
    $Res Function(_$CityModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? population = freezed,
    Object? area = freezed,
    Object? altitude = freezed,
    Object? isCoastal = freezed,
    Object? isMetropolitan = freezed,
    Object? region = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(
      _$CityModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        population: freezed == population
            ? _value.population
            : population // ignore: cast_nullable_to_non_nullable
                  as int?,
        area: freezed == area
            ? _value.area
            : area // ignore: cast_nullable_to_non_nullable
                  as int?,
        altitude: freezed == altitude
            ? _value.altitude
            : altitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        isCoastal: freezed == isCoastal
            ? _value.isCoastal
            : isCoastal // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isMetropolitan: freezed == isMetropolitan
            ? _value.isMetropolitan
            : isMetropolitan // ignore: cast_nullable_to_non_nullable
                  as bool?,
        region: freezed == region
            ? _value._region
            : region // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        coordinates: freezed == coordinates
            ? _value._coordinates
            : coordinates // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CityModelImpl implements _CityModel {
  const _$CityModelImpl({
    required this.id,
    required this.name,
    this.population,
    this.area,
    this.altitude,
    this.isCoastal,
    this.isMetropolitan,
    final Map<String, dynamic>? region,
    final Map<String, dynamic>? coordinates,
  }) : _region = region,
       _coordinates = coordinates;

  factory _$CityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int? population;
  @override
  final int? area;
  @override
  final double? altitude;
  @override
  final bool? isCoastal;
  @override
  final bool? isMetropolitan;
  final Map<String, dynamic>? _region;
  @override
  Map<String, dynamic>? get region {
    final value = _region;
    if (value == null) return null;
    if (_region is EqualUnmodifiableMapView) return _region;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _coordinates;
  @override
  Map<String, dynamic>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableMapView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CityModel(id: $id, name: $name, population: $population, area: $area, altitude: $altitude, isCoastal: $isCoastal, isMetropolitan: $isMetropolitan, region: $region, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.population, population) ||
                other.population == population) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.isCoastal, isCoastal) ||
                other.isCoastal == isCoastal) &&
            (identical(other.isMetropolitan, isMetropolitan) ||
                other.isMetropolitan == isMetropolitan) &&
            const DeepCollectionEquality().equals(other._region, _region) &&
            const DeepCollectionEquality().equals(
              other._coordinates,
              _coordinates,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    population,
    area,
    altitude,
    isCoastal,
    isMetropolitan,
    const DeepCollectionEquality().hash(_region),
    const DeepCollectionEquality().hash(_coordinates),
  );

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      __$$CityModelImplCopyWithImpl<_$CityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityModelImplToJson(this);
  }
}

abstract class _CityModel implements CityModel {
  const factory _CityModel({
    required final int id,
    required final String name,
    final int? population,
    final int? area,
    final double? altitude,
    final bool? isCoastal,
    final bool? isMetropolitan,
    final Map<String, dynamic>? region,
    final Map<String, dynamic>? coordinates,
  }) = _$CityModelImpl;

  factory _CityModel.fromJson(Map<String, dynamic> json) =
      _$CityModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int? get population;
  @override
  int? get area;
  @override
  double? get altitude;
  @override
  bool? get isCoastal;
  @override
  bool? get isMetropolitan;
  @override
  Map<String, dynamic>? get region;
  @override
  Map<String, dynamic>? get coordinates;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
