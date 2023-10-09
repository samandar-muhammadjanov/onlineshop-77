import 'package:equatable/equatable.dart';
import 'package:onlineshop_77/features/home/doman/entity/district_entity.dart';

class RegionEntity extends Equatable {
  final int id;
  final String name;
  @DistrictConverter()
  final List<DistrictEntity> districts;

  const RegionEntity({
    this.id = 0,
    this.name = '',
    this.districts = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        districts,
      ];
}
