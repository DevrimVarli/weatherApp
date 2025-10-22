// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      date: json['date'] as String,
      day: json['day'] as String,
      description: json['description'] as String,
      degree: json['degree'] as String,
      min: json['min'] as String,
      max: json['max'] as String,
      night: json['night'] as String,
      humidity: json['humidity'] as String,
      icon: json['icon'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'description': instance.description,
      'degree': instance.degree,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'humidity': instance.humidity,
      'icon': instance.icon,
      'status': instance.status,
    };
