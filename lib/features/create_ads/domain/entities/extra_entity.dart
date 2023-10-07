import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/create_ads/data/models/extra_model.dart';

class ExtraEntity extends Equatable {
  final bool isMine;
  final String status;
  final String expiresAt;

  const ExtraEntity({
    this.isMine = false,
    this.status = '',
    this.expiresAt = '',
  });

  @override
  List<Object?> get props => [
        isMine,
        status,
        expiresAt,
      ];
}

class ExtraConverter extends JsonConverter<ExtraEntity, Map<String, dynamic>> {
  @override
  ExtraEntity fromJson(Map<String, dynamic> json) => ExtraModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(ExtraEntity object) => {};

  const ExtraConverter();
}
