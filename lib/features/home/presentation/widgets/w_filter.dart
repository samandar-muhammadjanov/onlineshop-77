import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/categories/categories_bloc.dart';
import 'package:parent_child_checkbox/parent_child_checkbox.dart';

class WFilter extends StatefulWidget {
  const WFilter({
    super.key,
  });

  @override
  State<WFilter> createState() => _WFilterState();
}

class _WFilterState extends State<WFilter> {
  bool _isChecked = false; // Parent checkbox state
  bool _isExpanded = false; // Expansion tile state
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppConstants.kTransparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          color: AppConstants.kWhiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ExpansionTile(
              title: Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (newValue) {
                      setState(() {
                        _isChecked = newValue!;
                      });
                    },
                  ),
                  Text("Expandable Parent Checkbox"),
                ],
              ),
              children: <Widget>[
                // Add child widgets here when the parent is expanded
                // For example, you can add child checkboxes or other content
                CheckboxListTile(
                  title: Text("Child Checkbox 1"),
                  value: false,
                  onChanged: (newValue) {
                    // Handle the state change of child checkbox 1
                  },
                ),
                CheckboxListTile(
                  title: Text("Child Checkbox 2"),
                  value: false,
                  onChanged: (newValue) {
                    // Handle the state change of child checkbox 2
                  },
                ),
              ],
            ),
            const Text(
              "Фильтр",
              style: TextStyle(
                  color: AppConstants.kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
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
                        childrenPadding: EdgeInsets.zero,
                        shape: Border.all(color: AppConstants.kWhiteColor),
                        collapsedShape:
                            Border.all(color: AppConstants.kWhiteColor),
                        title: Text(item.name),
                        children: item.childs.map((e) {
                          if (e.childs == null) {
                            return const SizedBox();
                          }
                          return ExpansionTile(
                            leading: Checkbox(
                              value: item.isChecked,
                              onChanged: (value) {
                                item.isChecked = value;
                                setState(() {});
                              },
                            ),
                            title: Text(e.name),
                            children: (e.childs as List)
                                .map((e) => Text(e["name"]))
                                .toList(),
                          );
                        }).toList(),
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
