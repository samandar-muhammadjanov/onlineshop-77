import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:onlineshop_77/features/search/presentation/blocs/search_bloc.dart';

class WHighlightedText extends StatelessWidget {
  final String text;
  final String highlight;
  final Color highlightColor;

  const WHighlightedText({
    required this.text,
    required this.highlight,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> children = [];

    int startIndex = 0;
    int indexOfHighlight = text.indexOf(highlight);

    while (indexOfHighlight != -1) {
      // Add the text before the highlight.
      children.add(
        TextSpan(
          text: text.substring(startIndex, indexOfHighlight),
        ),
      );

      // Add the highlighted text with the specified color.
      children.add(
        TextSpan(
          text: text.substring(
            indexOfHighlight,
            indexOfHighlight + highlight.length,
          ),
          style: TextStyle(backgroundColor: highlightColor, height: 1.5, wordSpacing: 5),
        ),
      );

      // Update the start index.
      startIndex = indexOfHighlight + highlight.length;

      // Search for the next occurrence of the highlight.
      indexOfHighlight = text.indexOf(highlight, startIndex);
    }

    // Add any remaining text.
    children.add(
      TextSpan(
        text: text.substring(startIndex),
      ),
    );
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      onTap: () {
        // context.read<SearchsysBloc>().add(OnSearchResultEvent());
        // context.read<SearchsysBloc>().add(OnPopularSearchEvent(text));
        // context.read<SearchBloc>().add(GetSearchProductsEvent(text));
        // FocusScope.of(context).unfocus();
      },
      leading: SvgPicture.asset(
        AppAssets.search,
        color: AppColors.primaryColor,
      ),
      title: RichText(
        text: TextSpan(
          children: children,
          style: const TextStyle(
            color: AppColors.blackColor,
          ),
        ),
      ),
      trailing: SvgPicture.asset(AppAssets.chevronRight),
    );
  }
}
