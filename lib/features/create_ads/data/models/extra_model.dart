import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/create_ads/domain/entities/extra_entity.dart';

part 'extra_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ExtraModel extends ExtraEntity {
  const ExtraModel({
    super.expiresAt,
    super.isMine,
    super.status,
  });

  factory ExtraModel.fromJson(Map<String, dynamic> data) => _$ExtraModelFromJson(data);
}
