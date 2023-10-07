// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraModel _$ExtraModelFromJson(Map<String, dynamic> json) => ExtraModel(
      expiresAt: json['expires_at'] as String? ?? '',
      isMine: json['is_mine'] as bool? ?? false,
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$ExtraModelToJson(ExtraModel instance) =>
    <String, dynamic>{
      'is_mine': instance.isMine,
      'status': instance.status,
      'expires_at': instance.expiresAt,
    };
