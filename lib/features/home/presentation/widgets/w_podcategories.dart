import 'package:flutter/material.dart';
import 'package:onlineshop_77/core/utils/exports.dart';
import 'package:onlineshop_77/features/home/data/model/m_categories.dart';

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
        // BlocBuilder<CategoriesBloc, CategoriesState>(
        //   builder: (context, state) {
        //     if (state is CategoriesLoaded) {
        //       return CheckboxList(
        //         categories: state.categories,
        //       );
        //     } else {
        //       return const SizedBox();
        //     }
        //   },
        // ),
      ],
    );
  }
}

// class CheckboxList extends StatefulWidget {
//   const CheckboxList({super.key, required this.categories});
//   final List<Categories> categories;
//   @override
//   _CheckboxListState createState() => _CheckboxListState();
// }

// class _CheckboxListState extends State<CheckboxList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: widget.categories.length,
//       itemBuilder: (context, index) {
//         final item = widget.categories[index];
//         return CheckboxTile(item: item);
//       },
//     );
//   }
// }

// class CheckboxTile extends StatefulWidget {
//   final Categories item;

//   CheckboxTile({required this.item});

//   @override
//   _CheckboxTileState createState() => _CheckboxTileState();
// }

// class _CheckboxTileState extends State<CheckboxTile> {
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       title: Row(
//         children: [
//           Checkbox(
//             value: widget.item.isChecked,
//             onChanged: (value) {
//               setState(() {
//                 widget.item.isChecked = value!;
//                 _updateChildren(widget.item, value);
//                 _updateParent(widget.item, value);
//               });
//             },
//           ),
//           Text(widget.item.name),
//         ],
//       ),
//       children: widget.item.childs.isNotEmpty
//           ? widget.item.childs
//               .map((child) => CheckboxTile(item: child as Categories))
//               .toList()
//           : [],
//     );
//   }

//   void _updateChildren(Categories item, bool value) {
//     for (var child in item.childs) {
//       child.isChecked = value;
//       _updateChildren(child as Categories, value);
//     }
//   }

//   void _updateParent(Categories item, bool value) {
//     if (item.isChecked && value == false) {
//       for (var sibling in item.childs ?? []) {
//         if (sibling.isChecked) return;
//       }
//       item.isChecked = false;
//       _updateParent(item, value);
//     } else if (!item.isChecked && value == true && item != null) {
//       item.isChecked = true;
//       _updateParent(item, value);
//     }
//   }
// }
