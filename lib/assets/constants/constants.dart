// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppConstants {
  static const Color kPrimaryColor = Color(0xff388FF3);
  static const Color kBlackColor = Color(0xff16191D);
  static const Color kWhiteColor = Color(0xffffffff);
  static const Color kGreyTextColor = Color(0xff8E9297);
  static const Color kDarkGreyColor = Color(0xff63676C);
  static const Color kGreyColor = Color(0xffEAEDF0);
  static const Color kOrangeColor = Color(0xffFAAC36);
  static const Color kGreenColor = Color(0xff21B264);
  static const Color kRedColor = Color(0xffE93C47);
  static const Color kHintColor = Color(0xffB8BBBD);
  static const Color kBackgroundColor = Color(0xffF0F3F7);
  static const Color kTransparent = Colors.transparent;

  static const String BASE_URL =
      "https://backendmaster.pythonanywhere.com/ru/api/v1/";
  static const String PRODUCTS = "store/list/ads/";
  static const String REGISTRATION = "accounts/seller/registration/";
  static const String CATEGORIES = "store/categories-with-childs/";
  static const String LOGIN = "accounts/login/";
  static const String ME = "accounts/me/";
  static const String USER_PRODUCTS = "store/my-ads/";
  static const String PRODUCT_DETAIL = "store/ads/";
  static const String REFRESH_TOKEN = "accounts/token/refresh/";
  static const String SEARCH = "store/search/complete/?q=";
  static const String POPULAR_SEARCHS = "store/search/populars/";
}
