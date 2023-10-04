import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/search/search_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/searchCompleteResults/search_result_bloc.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/searchsys/saerchsys_bloc.dart';

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
            context.read<SearchsysBloc>().add(OnSearchInitialEvent());
          } else {
            context.read<SearchsysBloc>().add(OnSearchChangeEvent());
            context
                .read<SearchCompleteResultBloc>()
                .add(GetCompleteResultsEvent(value));
          }
        },
        onFieldSubmitted: (newValue) {
          if (newValue.isNotEmpty) {
            context.read<SearchsysBloc>().add(OnSearchResultEvent());
            context
                .read<SearchBloc>()
                .add(GetSearchProductsEvent("?search${controller.text}"));
          } else {
            FocusScope.of(context).unfocus();
          }
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
          suffixIcon: BlocBuilder<SearchsysBloc, SearchsysState>(
            builder: (context, state) {
              if (state is OnSearchInitial) {
                return const SizedBox();
              } else {
                return IconButton(
                  onPressed: () {
                    context.read<SearchsysBloc>().add(OnSearchInitialEvent());
                    controller.clear();
                    FocusScope.of(context).unfocus();
                  },
                  icon: SvgPicture.asset(
                    AppAssets.close,
                  ),
                );
              }
            },
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
