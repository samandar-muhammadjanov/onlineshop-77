import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/core/localization/supported_localizations.dart';
import 'package:onlineshop_77/core/routers/app_router.dart';
import 'package:onlineshop_77/core/storage/local_storage_repository.dart';
import 'package:onlineshop_77/core/storage/store_keys.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';
import 'package:onlineshop_77/core/theme/theme.dart';
import 'package:onlineshop_77/features/auth/presentation/bloc/bloc/category_bloc.dart';
import 'package:onlineshop_77/features/home/data/model/m_product.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/auth/auth_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/categories/categories_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/favorites/favorites_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/layout/layout_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/popularSearchs/popular_searchs_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productBloc/product_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productByCatgory/product_by_category_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productDetail/product_detail_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/search/search_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/searchCompleteResults/search_result_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/searchOnchanged/search_onchanged_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/user/user_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/userProduct/user_product_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await StorageRepository.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(ResultAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(DistrictAdapter());
  Hive.registerAdapter(RegionAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ExtraAdapter());
  Hive.registerAdapter(SellerAdapter());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppConstants.kWhiteColor,
    statusBarBrightness: Brightness.light,
  ));
  var isFirstTime =
      StorageRepository.getBool(StoreKeys.isFirstTime, defValue: false);
  runApp(
    EasyLocalization(
      supportedLocales: SupportedLocalizations.supportedLocalizations,
      path: "assets/translations",
      saveLocale: true,
      fallbackLocale: SupportedLocalizations.supportedLocalizations.first,
      child: MyApp(
        isFirstTime: isFirstTime,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstTime});
  final bool isFirstTime;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc()..add(GetProductsEvent("")),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc()..add(GetCategoriesEvent()),
        ),
        BlocProvider(
          create: (context) =>
              PopularSearchsBloc()..add(GetPopularSearchsEvent()),
        ),
        BlocProvider(
          create: (context) => AuthBloc()
            ..add(
              AuthinticatedEvent(isFirstTime),
            ),
        ),
        BlocProvider(
          create: (context) => UserBloc()
            ..add(
              GetUserDataEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(
            localstorageRepository: LocalstorageRepository(),
          )..add(
              StartFavorites(),
            ),
        ),
        BlocProvider(
          create: (context) => SearchOnchangedBloc(),
        ),
        BlocProvider(
          create: (context) => SearchCompleteResultBloc(),
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
        BlocProvider(
          create: (context) => UserProductBloc()..add(GetUserProducts()),
        )
      ],
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        title: '77UZ',
        theme: AppTheme.light,
        home: const Dashboard(),
      ),
    );
  }
}
