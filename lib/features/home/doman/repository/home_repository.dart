import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/features/home/doman/entity/region_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<RegionEntity>>> getRegions();
}
