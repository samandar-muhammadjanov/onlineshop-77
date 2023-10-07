import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/core/utils/params.dart';

abstract class CreateAdsRepository {
  Future<Either<Failure, void>> createNewAds(AdsParams params);
}
