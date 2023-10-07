import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/features/profile/data/data_source/profile_datasource.dart';
import 'package:onlineshop_77/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _dataSource = serviceLocator<ProfileDataSourceImpl>();


}
