import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/common/widgets/w_category_child.dart';
import 'package:onlineshop_77/features/common/widgets/w_product_by_category.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/productByCatgory/product_by_category_bloc.dart';

class WCategoryChildChild extends StatefulWidget {
  const WCategoryChildChild({
    super.key,
    required this.widget,
    required this.categoryIndex,
    required this.childChild,
    required this.childRoute,
    required this.title,
    required this.parentRoute,
  });

  final WCategoryChild widget;
  final int categoryIndex;
  final Function(bool, int) childRoute;
  final Function(bool, int) parentRoute;
  final List childChild;
  final String title;

  @override
  State<WCategoryChildChild> createState() => _WCategoryChildChildState();
}

class _WCategoryChildChildState extends State<WCategoryChildChild> {
  bool isParentCategory = false;
  int categoryIndex = 0;
  void _routeToChild(bool isParentCategory, int categoryIndex) {
    setState(() {
      this.isParentCategory = isParentCategory;
      this.categoryIndex = categoryIndex;
    });
  }

  String categoryTitle = '';
  @override
  Widget build(BuildContext context) {
    final title = widget.widget.state.categories[widget.widget.categoryIndex]
        .childs[widget.categoryIndex].name;
    if (!isParentCategory) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => widget.parentRoute(false, widget.categoryIndex),
                  child: SvgPicture.asset(AppAssets.arrowLeft),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24.5,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () =>
                        widget.childRoute(false, widget.categoryIndex),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.chevronLeft),
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.childChild.length,
                    itemBuilder: (context, index) {
                      final item = widget.childChild[index];
                      if (item["ads_count"] == 0) {
                        return const SizedBox(
                          height: 5,
                        );
                      }
                      return ListTile(
                        onTap: () {
                          categoryTitle = item["name"];
                          setState(() {});
                          _routeToChild(true, item["id"]);
                          context.read<ProductByCategoryBloc>().add(
                            GetProductsByCategoryEvent(
                              item["id"].toString(),
                            ),
                          );
                        },
                        title: Text(
                          item["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: SvgPicture.asset(
                          AppAssets.chevronRight,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return WProductByCategory(
        title: categoryTitle,
        childRoute: _routeToChild,
        categoryIndex: categoryIndex,
      );
    }
  }
}
