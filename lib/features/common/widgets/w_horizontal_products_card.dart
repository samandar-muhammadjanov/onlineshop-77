import 'package:flutter/material.dart';
import 'package:onlineshop_77/features/common/widgets/w_horizontal_product_item.dart';

class WHorizontalProductsCard extends StatelessWidget {
  const WHorizontalProductsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("WHorizontalProductsCard");
    // return ListView.separated(
    //   separatorBuilder: (context, index) => const SizedBox(
    //     height: 10,
    //   ),
    //   shrinkWrap: true,
    //   itemCount: state.products.results.length,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemBuilder: (context, index) {
    //     final item = state.products.results[index];
    //     return WHorizontalProductItem(item: item);
    //   },
    // );
  }
}
