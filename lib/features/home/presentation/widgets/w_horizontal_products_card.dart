import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/search/search_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/widgets/w_horizontal_product_item.dart';

class WHorizontalProductsCard extends StatelessWidget {
  const WHorizontalProductsCard({super.key, required this.state});
  final SearchLoaded state;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        shrinkWrap: true,
        itemCount: state.products.results.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = state.products.results[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: FadeInAnimation(
              child: WHorizontalProductItem(item: item),
            ),
          );
        },
      ),
    );
  }
}
