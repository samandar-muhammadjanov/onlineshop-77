import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/home/doman/entity/search_result_model.dart';

part 'search_result_model.g.dart';

@JsonSerializable()
class SearchResultModel extends SearchResultEntity {
  const SearchResultModel({
    super.name,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => _$SearchResultModelFromJson(json);
}
