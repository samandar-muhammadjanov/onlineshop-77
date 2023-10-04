// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:onlineshop_77/core/storage/store_keys.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';
import 'package:onlineshop_77/features/auth/domain/usecases/usecases.dart';
import 'package:onlineshop_77/features/auth/presentation/succes_register_screen.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/auth/auth_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/dashboard.dart';

class DataRepository {
  static Future<void> registration(
    String fullName,
    String projectName,
    int categoryId,
    String phoneNumber,
    String address,
    BuildContext context,
  ) async {
    final phone = phoneNumber
        .split("(")
        .join()
        .split(")")
        .join()
        .split("-")
        .join()
        .split(" ")
        .join();
    var response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.REGISTRATION),
        body: {
          "full_name": fullName,
          "project_name": projectName,
          "category": "$categoryId",
          "phone_number": "998$phone",
          "address": address
        });
    if (response.statusCode == 201) {
      Navigator.pushNamed(context, SuccessRegisterScreen.routeName);
    } else {
      Usecases.showSnackBar(
          context, "Something went wrong!", AppAssets.errorInfo);
    }
  }

  static Future<void> login(
    String login,
    String password,
    BuildContext context,
  ) async {
    await StorageRepository.getInstance();
    final response = await http.post(
        Uri.parse(AppConstants.BASE_URL + AppConstants.LOGIN),
        body: {"phone_number": login.split("+").join(), "password": password});
    final body = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      StorageRepository.putBool(key: StoreKeys.isFirstTime, value: true);
      StorageRepository.putString(StoreKeys.token, body["access_token"]);
      StorageRepository.putString(StoreKeys.refresh, body["refresh_token"]);
      context.read<AuthBloc>().add(AuthinticatedEvent(true));
      Navigator.pushNamedAndRemoveUntil(
          context, Dashboard.routeName, (route) => false);
    } else {
      Usecases.showSnackBar(
          context, body["non_field_errors"].toString(), AppAssets.errorInfo);
    }
  }
}
