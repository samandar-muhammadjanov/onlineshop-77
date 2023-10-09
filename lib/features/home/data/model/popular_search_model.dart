import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/home/doman/entity/popular_search_entity.dart';

part 'popular_search_model.g.dart';

@JsonSerializable()
class PopularSearchModel extends PopularSearchEntity {
  const PopularSearchModel({
    super.search_count,
    super.search_term,
  });

  factory PopularSearchModel.fromJson(Map<String, dynamic> json) => _$PopularSearchModelFromJson(json);
}
