import 'package:flutter/material.dart';
import 'package:onlineshop_77/core/utils/exports.dart';

class WPodCategories extends StatefulWidget {
  const WPodCategories({super.key});

  @override
  State<WPodCategories> createState() => _WPodCategoriesState();
}

class _WPodCategoriesState extends State<WPodCategories> {
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
          height: 8,
        ),
        BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoaded) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final item = state.categories[index];
                  return ExpansionTile(
                    textColor: AppConstants.kBlackColor,
                    collapsedTextColor: AppConstants.kBlackColor,
                    shape: Border.all(color: AppConstants.kWhiteColor),
                    collapsedShape: Border.all(color: AppConstants.kWhiteColor),
                    leading: GestureDetector(
                      onTap: () {
                        item.isChecked = !item.isChecked!;
                        setState(() {});
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: !item.isChecked!
                              ? null
                              : AppConstants.kPrimaryColor,
                          border: Border.all(color: AppConstants.kGreyColor),
                        ),
                        child: !item.isChecked!
                            ? const SizedBox()
                            : const Icon(
                                Icons.check,
                                size: 20,
                                color: AppConstants.kWhiteColor,
                              ),
                      ),
                    ),
                    tilePadding: EdgeInsets.zero,
                    title: Text(item.name),
                    children: List.generate(item.childs.length, (index) {
                      final childs = item.childs[index];
                      if (childs.childs == null) {
                        return const SizedBox();
                      }
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 22,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                childs.isChecked = !childs.isChecked!;
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: !childs.isChecked!
                                          ? null
                                          : AppConstants.kPrimaryColor,
                                      border: Border.all(
                                          color: AppConstants.kGreyColor),
                                    ),
                                    child: !childs.isChecked!
                                        ? const SizedBox()
                                        : const Icon(
                                            Icons.check,
                                            size: 20,
                                            color: AppConstants.kWhiteColor,
                                          ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    childs.name,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                            child: Divider(
                              thickness: 1.2,
                              height: 0,
                            ),
                          )
                        ],
                      );
                    }),
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
