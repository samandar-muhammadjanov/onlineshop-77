import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/categories/categories_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_category_child_child.dart';

import '../../../../assets/constants/constants.dart';

class WCategoryChild extends StatefulWidget {
  const WCategoryChild({
    super.key,
    required this.categoryIndex,
    required this.state,
    required this.routeToChild,
  });
  final CategoriesLoaded state;
  final int categoryIndex;
  final Function(bool, int) routeToChild;

  @override
  State<WCategoryChild> createState() => _WCategoryChildState();
}

class _WCategoryChildState extends State<WCategoryChild> {
  bool isParentCategory = false;
  int categoryIndex = 0;
  void _routeToChild(bool isParentCategory, int categoryIndex) {
    setState(() {
      this.isParentCategory = isParentCategory;
      this.categoryIndex = categoryIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final childChild = (widget.state.categories[widget.categoryIndex]
        .childs[categoryIndex].childs as List);
    final child = widget.state.categories[widget.categoryIndex];

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: !isParentCategory
            ? Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            widget.routeToChild(false, widget.categoryIndex),
                        child: SvgPicture.asset(AppAssets.arrowLeft),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        child.name,
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
                      color: AppConstants.kWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: AnimationLimiter(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: child.childs.length,
                        itemBuilder: (context, index) {
                          final item = child.childs[index];

                          if (item.childs == null) {
                            return const SizedBox();
                          }

                          return AnimationConfiguration.staggeredList(
                            position: index,
                            child: FadeInAnimation(
                              duration: const Duration(milliseconds: 500),
                              child: ListTile(
                                onTap: () => _routeToChild(true, index),
                                title: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: SvgPicture.asset(
                                  AppAssets.chevronRight,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            : WCategoryChildChild(
                title: child.name,
                parentRoute: widget.routeToChild,
                widget: widget,
                categoryIndex: categoryIndex,
                childChild: childChild,
                childRoute: _routeToChild,
              ));
  }
}
