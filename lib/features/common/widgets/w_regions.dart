import 'package:formz/formz.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:onlineshop_77/features/home/doman/entity/district_entity.dart';
import 'package:onlineshop_77/features/home/doman/entity/region_entity.dart';
import 'package:onlineshop_77/features/search/presentation/blocs/search_bloc.dart';

class WRegions extends StatefulWidget {
  const WRegions({
    super.key,
  });

  @override
  State<WRegions> createState() => _WRegionsState();
}

class _WRegionsState extends State<WRegions> {
  List<DistrictEntity> districts = [];
  String? selectedRegion;
  String? selectedDistrict;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Регион",
          style: TextStyle(color: AppColors.darkGreyColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.status.isSuccess) {
              return DropdownButtonHideUnderline(
                child: DropdownButton2<dynamic>(
                  isExpanded: true,
                  hint: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Все',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: state.regionEntity
                      .map(
                        (RegionEntity item) => DropdownMenuItem<dynamic>(
                          value: item.name,
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  value: selectedRegion,
                  onChanged: (value) {
                    var region = state.regionEntity.firstWhere((element) => element.name == value);
                    selectedDistrict = null;
                    districts = region.districts;
                    selectedRegion = value;
                    setState(() {});
                  },
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.greyColor,
                      ),
                    ),
                    elevation: 0,
                  ),
                  iconStyleData: IconStyleData(
                    openMenuIcon: SvgPicture.asset(AppAssets.chevronDown),
                    icon: SvgPicture.asset(AppAssets.chevronRight),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 343,
                    width: MediaQuery.of(context).size.width * 0.92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 28,
                          spreadRadius: 0,
                          color: AppColors.blackColor.withOpacity(0.2),
                        )
                      ],
                    ),
                    elevation: 0,
                    offset: const Offset(0, -10),
                    scrollbarTheme: ScrollbarThemeData(
                      thumbColor: MaterialStateProperty.all(AppColors.greyColor),
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Район/город",
          style: TextStyle(color: AppColors.darkGreyColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<dynamic>(
            isExpanded: true,
            hint: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Все',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: districts
                .map(
                  (item) => DropdownMenuItem<dynamic>(
                    value: item.name,
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            value: selectedDistrict,
            onChanged: (value) {
              selectedDistrict = value;
              setState(() {});
            },
            buttonStyleData: ButtonStyleData(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.greyColor,
                ),
              ),
              elevation: 0,
            ),
            iconStyleData: IconStyleData(
              openMenuIcon: SvgPicture.asset(AppAssets.chevronDown),
              icon: SvgPicture.asset(AppAssets.chevronRight),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 343,
              width: MediaQuery.of(context).size.width * 0.92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 28,
                    spreadRadius: 0,
                    color: AppColors.blackColor.withOpacity(0.2),
                  )
                ],
              ),
              elevation: 0,
              offset: const Offset(0, -10),
              scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(AppColors.greyColor),
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        )
      ],
    );
  }
}
