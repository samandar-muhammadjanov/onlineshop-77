import 'package:hive_flutter/hive_flutter.dart';
import 'package:onlineshop_77/core/storage/store_keys.dart';

import '../../features/home/data/model/m_product.dart';
import 'base_local_storage_repository.dart';

class LocalstorageRepository extends BaseLocalstorageRepository {
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<Result>(StoreKeys.box);
    return box;
  }

  @override
  List<Result> getFavorites(Box box) {
    return box.values.toList() as List<Result>;
  }

  @override
  Future<void> addNewstoFavorites(Box box, Result product) {
    return box.put(product.id, product);
  }

  @override
  Future<void> removeNewsFromFavorites(Box box, Result product) {
    return box.delete(product.id);
  }

  @override
  Future<void> clearFavorites(Box box) {
    return box.clear();
  }
}
