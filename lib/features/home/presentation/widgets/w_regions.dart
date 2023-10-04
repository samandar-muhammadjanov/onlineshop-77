import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';
import 'package:onlineshop_77/features/home/data/model/m_regions.dart';
import 'package:onlineshop_77/features/home/presentation/bloc/region/regions_bloc.dart';

class WRegions extends StatefulWidget {
  const WRegions({
    super.key,
  });

  @override
  State<WRegions> createState() => _WRegionsState();
}

class _WRegionsState extends State<WRegions> {
  List<District> districts = [];
  String? selectedRegion;
  String? selectedDistrict;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Регион",
          style: TextStyle(
              color: AppConstants.kDarkGreyColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        BlocBuilder<RegionsBloc, RegionsState>(
          builder: (context, state) {
            if (state is RegionsLoaded) {
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
                  items: state.regions
                      .map(
                        (Regions item) => DropdownMenuItem<dynamic>(
                          value: item.name,
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppConstants.kBlackColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  value: selectedRegion,
                  onChanged: (value) {
                    var region = state.regions
                        .firstWhere((element) => element.name == value);
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
                        color: AppConstants.kGreyColor,
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
                      color: AppConstants.kWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 28,
                          spreadRadius: 0,
                          color: AppConstants.kBlackColor.withOpacity(0.2),
                        )
                      ],
                    ),
                    elevation: 0,
                    offset: const Offset(0, -10),
                    scrollbarTheme: ScrollbarThemeData(
                      thumbColor:
                          MaterialStateProperty.all(AppConstants.kGreyColor),
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
            } else if (state is RegionsInitial) {
              return const SizedBox();
            } else if (state is RegionsLoading) {
              return const SizedBox();
            } else if (state is RegionsError) {
              return Text(state.error);
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
          style: TextStyle(
              color: AppConstants.kDarkGreyColor, fontWeight: FontWeight.w500),
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
                  (District item) => DropdownMenuItem<dynamic>(
                    value: item.name,
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppConstants.kBlackColor,
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
                  color: AppConstants.kGreyColor,
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
                color: AppConstants.kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 28,
                    spreadRadius: 0,
                    color: AppConstants.kBlackColor.withOpacity(0.2),
                  )
                ],
              ),
              elevation: 0,
              offset: const Offset(0, -10),
              scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(AppConstants.kGreyColor),
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
