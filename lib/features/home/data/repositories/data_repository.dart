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
import '../../../categories/data/models/caregories_model.dart';
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

  static Future<List<PopularSearchs>> getPopularSaerchs() async {
    final response = await http.get(
      Uri.parse(AppConstants.BASE_URL + AppConstants.POPULAR_SEARCHES),
    );

    try {
      List<PopularSearchs> popularSeachs = popularSearchsFromJson(utf8.decode(response.bodyBytes));
      return popularSeachs;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<UserData> getUserData() async {
    await StorageRepository.getInstance();
    var accessToken = StorageRepository.getString(StoreKeys.token);
    var headers = {'Authorization': 'Bearer $accessToken'};
    final response = await http.get(Uri.parse(AppConstants.BASE_URL + AppConstants.ME), headers: headers);

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

  static Future<List<SearchResult>> search(String query) async {
    final response = await http.get(Uri.parse(AppConstants.BASE_URL + AppConstants.SEARCH + query));
    if (response.statusCode == 200) {
      List<SearchResult> searchResult = searchResultFromJson(utf8.decode(response.bodyBytes));
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
      ProductDetail productDetail = productDetailFromJson(utf8.decode(response.bodyBytes));

      return productDetail;
    } else {
      return throw Exception(response.statusCode);
    }
  }

  static Future<List<MyProducts>> getMyProducts() async {
    await StorageRepository.getInstance();
    final token = StorageRepository.getString(StoreKeys.token);
    var headers = {'Authorization': 'Bearer $token'};

    final response = await http.get(Uri.parse(AppConstants.BASE_URL + AppConstants.USER_PRODUCTS), headers: headers);
    if (response.statusCode == 200) {
      List<MyProducts> products = myProductsFromJson(utf8.decode(response.bodyBytes));
      return products;
    } else {
      return throw Exception(response.body);
    }
  }

  static Future<List<Regions>> getRegions() async {
    final response = await http.get(Uri.parse(AppConstants.BASE_URL + AppConstants.REGION));

    if (response.statusCode == 200) {
      List<Regions> regions = regionsFromJson(utf8.decode(response.bodyBytes));
      return regions;
    } else {
      return throw Exception(response.body);
    }
  }
}
