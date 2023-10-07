import 'package:flutter/material.dart';
import 'package:onlineshop_77/core/utils/size_config.dart';
import 'package:onlineshop_77/features/common/widgets/w_product_item.dart';
import 'package:onlineshop_77/features/search/presentation/blocs/search_bloc.dart';

class WSearchCard extends StatelessWidget {
  const WSearchCard({
    super.key,
    required this.state,
  });

  final SearchLoaded state;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.products.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        crossAxisCount: 2,
        childAspectRatio: wi(0.598),
      ),
      itemBuilder: (context, index) {
        final item = state.products.results[index];
        return WProductItem(item: item);
      },
    );
  }
}
