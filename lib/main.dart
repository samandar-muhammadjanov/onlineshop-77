import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/assets/theme/theme.dart';
import 'package:onlineshop_77/core/localization/supported_localizations.dart';
import 'package:onlineshop_77/core/routers/app_router.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';
import 'package:onlineshop_77/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:onlineshop_77/features/categories/presentation/blocs/categories_bloc.dart';
import 'package:onlineshop_77/features/search/presentation/blocs/search_bloc.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      await StorageRepository.getInstance();
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.whiteColor,
        statusBarBrightness: Brightness.light,
      ));
      runApp(
        EasyLocalization(
          supportedLocales: SupportedLocalizations.supportedLocalizations,
          path: "assets/translations",
          saveLocale: true,
          fallbackLocale: SupportedLocalizations.supportedLocalizations.first,
          child: const MyApp(),
        ),
      );
    },
    (error, stack) {
      log("ERROR HANDLED BY RUNZONE: $error ,\nSTACK: $stack");
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc()..add(GetCategoriesEvent()),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
      ],
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: Routes.dashboard,
        title: '77UZ',
        theme: AppTheme.light,
      ),
    );
  }
}
