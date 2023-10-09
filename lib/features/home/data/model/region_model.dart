import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/home/doman/entity/district_entity.dart';
import 'package:onlineshop_77/features/home/doman/entity/region_entity.dart';

part 'region_model.g.dart';

@JsonSerializable()
class RegionModel extends RegionEntity {
  const RegionModel({
    super.id,
    super.name,
    super.districts,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) => _$RegionModelFromJson(json);
}
