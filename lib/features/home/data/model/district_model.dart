import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/home/doman/entity/district_entity.dart';

part 'district_model.g.dart';

@JsonSerializable()
class DistrictModel extends DistrictEntity {
  const DistrictModel({
    super.id,
    super.name,
  });

  factory DistrictModel.fromJson(Map<String,dynamic> json) => _$DistrictModelFromJson(json);
}
