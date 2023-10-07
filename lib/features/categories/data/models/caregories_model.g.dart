// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caregories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      adsCount: json['ads_count'] as int? ?? 0,
      icon: json['icon'] as String? ?? '',
      childs: (json['childs'] as List<dynamic>?)
              ?.map((e) =>
                  const CtgChildConverter().fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ads_count': instance.adsCount,
      'icon': instance.icon,
      'childs': instance.childs.map(const CtgChildConverter().toJson).toList(),
    };
