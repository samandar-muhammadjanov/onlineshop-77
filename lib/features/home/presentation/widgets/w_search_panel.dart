import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/search/search_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/searchCompleteResults/search_result_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/searchOnchanged/search_onchanged_bloc.dart';

import '../../../../assets/assets.dart';
import '../../../../assets/constants/constants.dart';
import '../../../../generated/locale_keys.g.dart';

class WSearchPanel extends StatefulWidget {
  const WSearchPanel({
    super.key,
  });

  @override
  State<WSearchPanel> createState() => _WSearchPanelState();
}

class _WSearchPanelState extends State<WSearchPanel> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      decoration: const BoxDecoration(color: AppConstants.kWhiteColor),
      child: TextFormField(
        controller: controller,
        textCapitalization: TextCapitalization.words,
        onChanged: (value) {
          if (value.isEmpty) {
            context.read<SearchOnchangedBloc>().add(OnUnchangeEvent());
          } else {
            context.read<SearchOnchangedBloc>().add(OnchangeEvent());
            context
                .read<SearchCompleteResultBloc>()
                .add(GetCompleteResultsEvent(value));
          }
        },
        onFieldSubmitted: (newValue) {
          context.read<SearchOnchangedBloc>().add(OnUnchangeEvent());
          context.read<SearchBloc>().add(
                GetSearchProductsEvent(controller.text),
              );
        },
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.search),
          ),
          hintText: LocaleKeys.searchHint.tr(),
          hintStyle: const TextStyle(
              color: AppConstants.kHintColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          suffixIcon: GestureDetector(
            onTap: () {
              context.read<SearchBloc>().add(
                    GetSearchProductsEvent(controller.text),
                  );
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 6,
              ),
              width: 107,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppConstants.kBlackColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                LocaleKeys.search.tr(),
                style: const TextStyle(
                    color: AppConstants.kWhiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppConstants.kGreyColor),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppConstants.kGreyColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
