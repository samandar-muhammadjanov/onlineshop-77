import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/core/utils/exports.dart';

class WPodCategories extends StatefulWidget {
  const WPodCategories({super.key});

  @override
  State<WPodCategories> createState() => _WPodCategoriesState();
}

class _WPodCategoriesState extends State<WPodCategories> {
  List<dynamic> selectedCategories = [];
  bool checkBoxes = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Подкатегории",
          style: TextStyle(
              color: AppConstants.kDarkGreyColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 18,
        ),
        BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoaded) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 0,
                  color: AppConstants.kBorderColor,
                  thickness: 1,
                ),
                itemCount: state.categories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  var isAnyChildSelected = category.childs
                      .any((element) => element.isChecked == true);
                  final selectedAll =
                      selectedCategories.length == category.childs.length;
                  return ExpansionTile(
                    collapsedShape: Border.all(color: AppConstants.kWhiteColor),
                    shape: Border.all(color: AppConstants.kWhiteColor),
                    title: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isAnyChildSelected
                                    ? AppConstants.kPrimaryColor
                                    : AppConstants.kTransparent,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: AppConstants.kBorderColor,
                                ),
                              ),
                              child: SvgPicture.asset(!selectedAll
                                  ? AppAssets.minus
                                  : AppAssets.check)),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          category.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppConstants.kBlackColor,
                          ),
                        )
                      ],
                    ),
                    children: category.childs
                        .map(
                          (categoryChild) => ExpansionTile(
                            tilePadding: const EdgeInsets.only(
                              left: 40,
                              right: 15,
                            ),
                            collapsedShape:
                                Border.all(color: AppConstants.kWhiteColor),
                            shape: Border.all(color: AppConstants.kWhiteColor),
                            title: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    categoryChild.isChecked =
                                        !(categoryChild.isChecked as bool);
                                    if (selectedCategories
                                        .contains(categoryChild)) {
                                      selectedCategories.remove(categoryChild);
                                    } else {
                                      selectedCategories.add(categoryChild);
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: (categoryChild.isChecked as bool)
                                          ? AppConstants.kPrimaryColor
                                          : AppConstants.kTransparent,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: AppConstants.kBorderColor,
                                      ),
                                    ),
                                    child: SvgPicture.asset(AppAssets.check),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  categoryChild.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppConstants.kBlackColor,
                                  ),
                                )
                              ],
                            ),
                            children: categoryChild.childs != null
                                ? (categoryChild.childs as List)
                                    .map((categorChildChild) => Padding(
                                          padding: const EdgeInsets.only(
                                              left: 70, bottom: 15),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                    color: AppConstants
                                                        .kBorderColor,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                categorChildChild["name"],
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppConstants.kBlackColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ))
                                    .toList()
                                : [],
                          ),
                        )
                        .toList(),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
