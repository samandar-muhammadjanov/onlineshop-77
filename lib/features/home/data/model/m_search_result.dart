import 'dart:convert';

List<SearchResult> searchResultFromJson(String str) => List<SearchResult>.from(
    json.decode(str).map((x) => SearchResult.fromJson(x)));

String searchResultToJson(List<SearchResult> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchResult {
  String name;

  SearchResult({
    required this.name,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
