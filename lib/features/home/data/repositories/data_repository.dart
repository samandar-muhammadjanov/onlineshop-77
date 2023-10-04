// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:onlineshop_77/core/storage/store_keys.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';
import 'package:onlineshop_77/features/home/data/model/m_my_products.dart';
import 'package:onlineshop_77/features/home/data/model/m_regions.dart';
import 'package:onlineshop_77/features/home/data/model/m_search_result.dart';
import '../model/m_categories.dart';
import '../model/m_popular_search.dart';
import '../model/m_product.dart';
import '../model/m_product_detail.dart';
import '../model/m_user_data.dart';

class HomeRepository {
  static Future<Products> getProducts(String parametr) async {
    final response = await http.get(
      Uri.parse(AppConstants.BASE_URL + AppConstants.PRODUCTS + parametr),
    );
    if (response.statusCode == 200) {
      Products products = productsFromJson(
        utf8.decode(response.bodyBytes),
      );
      return products;
    } else {
      return throw Exception(response.statusCode);
    }
  }

  static Future<List<Categories>> getCategories() async {
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL + AppConstants.CATEGORIES),
    );

    if (response.statusCode == 200) {
      List<Categories> categories =
          categoriesFromJson(utf8.decode(response.bodyBytes));
      return categories;
    } else {
      return throw Exception("Something went wrong: ${response.statusCode}");
    }
  }

  static Future<List<PopularSearchs>> getPopularSaerchs() async {
    final response = await http.get(
      Uri.parse(AppConstants.BASE_URL + AppConstants.POPULAR_SEARCHS),
    );

    try {
      List<PopularSearchs> popularSeachs =
          popularSearchsFromJson(utf8.decode(response.bodyBytes));
      return popularSeachs;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<UserData> getUserData() async {
    await StorageRepository.getInstance();
    var accessToken = StorageRepository.getString(StoreKeys.token);
    var headers = {'Authorization': 'Bearer $accessToken'};
    final response = await http.get(
        Uri.parse(AppConstants.BASE_URL + AppConstants.ME),
        headers: headers);

    if (response.statusCode == 200) {
      UserData userData = userDataFromJson(utf8.decode(response.bodyBytes));
      return userData;
    } else if (response.statusCode == 401) {
      refreshToken();
      return getUserData();
    } else {
      return throw Exception(response.statusCode);
    }
  }

  Future<void> refreshToken() async {
    await StorageRepository.getInstance();
    final refreshToken = StorageRepository.getString(StoreKeys.refresh);
    final response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.REFRESH_TOKEN),
        body: {"refresh_token": refreshToken});
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await StorageRepository.putString(StoreKeys.token, body["access_token"]);
    } else if (response.statusCode == 401) {
      StorageRepository.deleteString(StoreKeys.token);
      StorageRepository.deleteString(StoreKeys.token);
      StorageRepository.deleteString(StoreKeys.language);
    } else {
      return;
    }
  }

  static Future<List<SearchResult>> search(String query) async {
    final response = await http
        .get(Uri.parse(AppConstants.BASE_URL + AppConstants.SEARCH + query));
    if (response.statusCode == 200) {
      List<SearchResult> searchResult =
          searchResultFromJson(utf8.decode(response.bodyBytes));
      return searchResult;
    } else {
      return [];
    }
  }

  static Future<ProductDetail> getProductDetail(String slug) async {
    var response = await http.get(
      Uri.parse(AppConstants.BASE_URL + AppConstants.PRODUCT_DETAIL + slug),
    );

    if (response.statusCode == 200) {
      ProductDetail productDetail =
          productDetailFromJson(utf8.decode(response.bodyBytes));

      return productDetail;
    } else {
      return throw Exception(response.statusCode);
    }
  }

  static Future<List<MyProducts>> getMyProducts() async {
    await StorageRepository.getInstance();
    final token = StorageRepository.getString(StoreKeys.token);
    var headers = {'Authorization': 'Bearer $token'};

    final response = await http.get(
        Uri.parse(AppConstants.BASE_URL + AppConstants.USER_PRODUCTS),
        headers: headers);
    if (response.statusCode == 200) {
      List<MyProducts> products =
          myProductsFromJson(utf8.decode(response.bodyBytes));
      return products;
    } else {
      return throw Exception(response.body);
    }
  }

  static Future<void> addProduct(name, currency, price, description,
      List<XFile> paths, categoryId, BuildContext context) async {
    await StorageRepository.getInstance();
    var accessToken = StorageRepository.getString(StoreKeys.token);

    var headers = {'Authorization': 'Bearer $accessToken'};
    var request = http.MultipartRequest(
        'POST', Uri.parse(AppConstants.BASE_URL + AppConstants.PRODUCT_DETAIL));
    request.fields.addAll({
      'name': name,
      'category': "$categoryId",
      'description': description,
      'price': price.toString(),
      'currency': currency,
      'address': '2'
    });
    for (var i = 0; i < paths.length; i++) {
      request.files
          .add(await http.MultipartFile.fromPath('photos[$i]', paths[i].path));
    }

    request.headers.addAll(headers);

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Product Successfully added",
          ),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response.statusCode.toString(),
          ),
        ),
      );
    }
  }

  static Future<List<Regions>> getRegions() async {
    final response =
        await http.get(Uri.parse(AppConstants.BASE_URL + AppConstants.REGION));

    if (response.statusCode == 200) {
      List<Regions> regions = regionsFromJson(utf8.decode(response.bodyBytes));
      return regions;
    } else {
      return throw Exception(response.body);
    }
  }
}
