// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryChildModel _$CategoryChildModelFromJson(Map<String, dynamic> json) =>
    CategoryChildModel(
      childs: (json['childs'] as List<dynamic>?)
              ?.map((e) =>
                  const CtgChildConverter().fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryChildModelToJson(CategoryChildModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'childs': instance.childs?.map(const CtgChildConverter().toJson).toList(),
    };
