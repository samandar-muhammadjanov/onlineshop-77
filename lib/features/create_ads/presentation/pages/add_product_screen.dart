import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/features/common/widgets/w_contact_information.dart';
import 'package:onlineshop_77/features/common/widgets/w_important_information.dart';
import 'package:onlineshop_77/features/common/widgets/w_photo.dart';
import 'package:onlineshop_77/features/common/widgets/w_price.dart';
import 'package:onlineshop_77/features/common/widgets/w_publish.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<XFile> images = [];
  String productName = "";
  int categoryID = 0;
  String description = "";
  int price = 0;
  String currency = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _getImportantInformations(
    String productName,
    int categoryID,
    String description,
  ) {
    this.productName = productName;
    this.categoryID = categoryID;
    this.description = description;
    setState(() {});
  }

  void _getPrices(int price, String currency) {
    this.price = price;
    this.currency = currency;
    setState(() {});
  }

  void _getImages(List<XFile> images) {
    setState(() {
      this.images = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          LocaleKeys.createProduct.tr(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(AppAssets.arrowLeftSm),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const WContactInformation(),
            const Gap(),
            WImportantInformations(getImportantIInfo: _getImportantInformations, formKey: _formKey),
            const Gap(),
            WPrice(getPrice: _getPrices, formKey: _formKey),
            const Gap(),
            WPhoto(getImages: _getImages),
            const Gap(),
            // BlocBuilder<CategoryBloc, CategoryState>(
            //   builder: (context, state) {
            //     return WPublish(
            //       formKey: _formKey,
            //       productName: productName,
            //       categoryId: state.id,
            //       currency: currency,
            //       description: description,
            //       price: price,
            //       paths: images,
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

class Gap extends StatelessWidget {
  const Gap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 16);
  }
}
