// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      population: (json['population'] as num?)?.toInt(),
      area: (json['area'] as num?)?.toInt(),
      altitude: (json['altitude'] as num?)?.toDouble(),
      isCoastal: json['isCoastal'] as bool?,
      isMetropolitan: json['isMetropolitan'] as bool?,
      region: json['region'] as Map<String, dynamic>?,
      coordinates: json['coordinates'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'population': instance.population,
      'area': instance.area,
      'altitude': instance.altitude,
      'isCoastal': instance.isCoastal,
      'isMetropolitan': instance.isMetropolitan,
      'region': instance.region,
      'coordinates': instance.coordinates,
    };
