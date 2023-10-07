// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_caregories_mod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsCategoriesModel _$AdsCategoriesModelFromJson(Map<String, dynamic> json) =>
    AdsCategoriesModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      adsCount: json['ads_count'] as int? ?? 0,
      icon: json['icon'] as String? ?? '',
      parentCategory:
          _$JsonConverterFromJson<Map<String, dynamic>, AdsCategoriesEntity>(
              json['parent_category'], const AdsCategoryConverter().fromJson),
    );

Map<String, dynamic> _$AdsCategoriesModelToJson(AdsCategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ads_count': instance.adsCount,
      'icon': instance.icon,
      'parent_category':
          _$JsonConverterToJson<Map<String, dynamic>, AdsCategoriesEntity>(
              instance.parentCategory, const AdsCategoryConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
