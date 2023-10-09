import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/common/widgets/w_horizontal_product_item.dart';
import 'package:onlineshop_77/features/common/widgets/w_layout.dart';
import 'package:onlineshop_77/features/common/widgets/w_product_item.dart';

class WProductByCategory extends StatelessWidget {
  const WProductByCategory({
    super.key,
    required this.title,
    required this.categoryIndex,
    required this.childRoute,
  });

  final int categoryIndex;
  final Function(bool, int) childRoute;
  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      physics: const BouncingScrollPhysics(),
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => childRoute(false, categoryIndex),
              child: SvgPicture.asset(AppAssets.arrowLeft),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const WLayout(),
        const SizedBox(
          height: 16,
        ),
        Text("ProductByCategoryBloc"),
        // BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
        //   builder: (context, state) {
        //     if (state is ProductByCategoryLoaded) {
        //       return BlocBuilder<LayoutBloc, LayoutState>(
        //         builder: (context, layoutState) {
        //           if (layoutState.isVertical) {
        //             return ListView.separated(
        //               separatorBuilder: (context, index) => const SizedBox(
        //                 height: 10,
        //               ),
        //               shrinkWrap: true,
        //               itemCount: state.products.results.length,
        //               physics: const NeverScrollableScrollPhysics(),
        //               itemBuilder: (context, index) {
        //                 final item = state.products.results[index];
        //                 return WHorizontalProductItem(item: item);
        //               },
        //             );
        //           }
        //           return GridView.builder(
        //             shrinkWrap: true,
        //             physics: const NeverScrollableScrollPhysics(),
        //             itemCount: state.products.results.length,
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               mainAxisSpacing: 16,
        //               crossAxisSpacing: 12,
        //               crossAxisCount: 2,
        //               childAspectRatio: wi(0.598),
        //             ),
        //             itemBuilder: (context, index) {
        //               final item = state.products.results[index];
        //               return WProductItem(item: item);
        //             },
        //           );
        //         },
        //       );
        //     }
        //     return const SizedBox();
        //   },
        // )
      ],
    );
  }
}
