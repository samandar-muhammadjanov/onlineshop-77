import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/home/data/model/district_model.dart';

class DistrictEntity extends Equatable {
  final int id;
  final String name;

  const DistrictEntity({
    this.id = 0,
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class DistrictConverter extends JsonConverter<DistrictEntity, Map<String, dynamic>> {
  @override
  DistrictEntity fromJson(Map<String, dynamic> json) => DistrictModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(DistrictEntity object) => {};

  const DistrictConverter();
}
