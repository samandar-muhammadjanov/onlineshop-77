import 'dart:convert';

List<PopularSearchs> popularSearchsFromJson(String str) =>
    List<PopularSearchs>.from(
        json.decode(str).map((x) => PopularSearchs.fromJson(x)));

String popularSearchsToJson(List<PopularSearchs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PopularSearchs {
  String searchTerm;
  int searchCount;

  PopularSearchs({
    required this.searchTerm,
    required this.searchCount,
  });

  factory PopularSearchs.fromJson(Map<String, dynamic> json) => PopularSearchs(
        searchTerm: json["search_term"],
        searchCount: json["search_count"],
      );

  Map<String, dynamic> toJson() => {
        "search_term": searchTerm,
        "search_count": searchCount,
      };
}
