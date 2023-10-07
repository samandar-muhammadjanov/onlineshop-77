import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/features/search/data/data_source/search_datasource.dart';
import 'package:onlineshop_77/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository{
  final SearchDataSource _dataSource = serviceLocator<SearchDataSourceImpl>();



}