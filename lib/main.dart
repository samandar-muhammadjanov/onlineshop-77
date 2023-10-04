import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/region/regions_bloc.dart';
import './core/utils/exports.dart';

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
        ),
        BlocProvider(
          create: (context) => SearchsysBloc()
            ..add(
              OnSearchInitialEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => MiniCategoryBloc(),
        ),
        BlocProvider(
          create: (context) => RegionsBloc()
            ..add(
              GetRegionsEvent(),
            ),
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
