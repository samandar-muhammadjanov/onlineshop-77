import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/data/model/m_product.dart';

abstract class BaseLocalstorageRepository {
  Future<Box> openBox();
  List<Result> getFavorites(Box box);
  Future<void> addNewstoFavorites(Box box, Result product);
  Future<void> removeNewsFromFavorites(Box box, Result product);
  Future<void> clearFavorites(Box box);
}
