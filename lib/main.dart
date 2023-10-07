import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/core/localization/supported_localizations.dart';
import 'package:onlineshop_77/core/routers/app_router.dart';
import 'package:onlineshop_77/core/storage/local_storage_repository.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';
import 'package:onlineshop_77/core/theme/theme.dart';
import 'package:onlineshop_77/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:onlineshop_77/features/categories/presentation/blocs/categories_bloc.dart';
import 'package:onlineshop_77/features/favorites/presentation/blocs/favorites_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/layout/layout_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/popularSearchs/popular_searchs_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productBloc/product_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productByCatgory/product_by_category_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productDetail/product_detail_bloc.dart';
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
          create: (context) => ProductBloc()..add(GetProductsEvent("")),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc()..add(GetCategoriesEvent()),
        ),
        BlocProvider(
          create: (context) => PopularSearchsBloc()..add(GetPopularSearchsEvent()),
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(localstorageRepository: LocalstorageRepository())
            ..add(
              StartFavorites(),
            ),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
          create: (context) => LayoutBloc(),
        ),
        BlocProvider(
          create: (context) => ProductDetailBloc(),
        ),
        BlocProvider(
          create: (context) => ProductByCategoryBloc(),
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
