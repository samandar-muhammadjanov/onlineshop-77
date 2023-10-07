// import 'dart:convert';
// import 'dart:math';
//
// import 'package:crypto/crypto.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';
//
// // ignore: avoid_classes_with_only_static_members
// class MyFunctions {
//
//   static String formatRating(double rating) => rating.toStringAsFixed(1);
//
//   static Duration parseDuration(String time) {
//     final timeParts = time.split(':');
//     return Duration(
//         hours: int.parse(timeParts[0]),
//         minutes: int.parse(timeParts[1]),
//         seconds: int.parse(timeParts[2].split('.').first));
//   }
//
//   static String getFormatCost(PriceREntity? price, {required bool isForeign, bool isFromCoupon = false}) {
//     if (price == null) return '0';
//     if (isForeign) {
//       if (price!.priceUsd == 0) {
//         return 'Free';
//       } else {
//         return '${price!.priceUsd} USD';
//       }
//     } else {
//       final priceAsInt = price!.price.toInt();
//       if (price!.price == 0) {
//         return isFromCoupon ? '0 UZS' : 'Bepul';
//       } else {
//         final oldCost = StringBuffer(priceAsInt.toString());
//         final newCost = StringBuffer();
//
//         for (var i = 0; i < oldCost.length; i++) {
//           if ((oldCost.length - i) % 3 == 0 && i != 0) {
//             newCost.write(' ');
//           }
//           newCost.write(oldCost.toString()[i]);
//         }
//         return '$newCost UZS';
//       }
//     }
//   }
//
//   static String getFormatCostFromInt(int price, {bool isForeign = false, bool shoFree = false}) {
//     if (isForeign) {
//       if (price == 0) {
//         return 'Free';
//       } else {
//         return '$price USD';
//       }
//     } else {
//       if (price == 0) {
//         return shoFree ? 'Bepul' : '0 UZS';
//       } else {
//         final oldCost = StringBuffer(price.toString());
//         final newCost = StringBuffer();
//
//         for (var i = 0; i < oldCost.length; i++) {
//           if ((oldCost.length - i) % 3 == 0 && i != 0) newCost.write(' ');
//           newCost.write(oldCost.toString()[i]);
//         }
//         return '$newCost UZS';
//       }
//     }
//   }
//
//   static String getFormatTime(Duration duration) => duration.toString().split('.').first.padLeft(8, '0');
//
//   static String getInitials(String title) {
//     if (title.isEmpty) {
//       return '';
//     }
//
//     final tmp = title.split(' ');
//     if (tmp.length < 2) {
//       return title[0];
//     }
//
//     return tmp[0][0] + tmp[1][0];
//   }
//
//   static List<BookType> getBookTypes() => [
//         const BookType(id: 3, title: 'Elektron kitob', icon: AppIcons.typeEbook),
//         const BookType(id: 1, title: "Qog'oz kitob", icon: AppIcons.typeBook),
//         const BookType(id: 2, title: 'Audio kitob', icon: AppIcons.typeAudiobook),
//       ];
//
//   static String getFormatDate(String date) {
//     DateTime dateTime;
//     if (date != '') {
//       dateTime = DateTime.parse(date);
//     } else {
//       dateTime = DateTime.now().subtract(const Duration(days: 2));
//     }
//
//     final differenceInDays = DateTime.now().difference(dateTime).inDays;
//     if (differenceInDays == 0) {
//       if (DateTime.now().difference(dateTime).inHours >= 1) {
//         return '${DateTime.now().difference(dateTime).inHours} soat avval';
//       } else {
//         if (DateTime.now().difference(dateTime).inMinutes >= 1) {
//           return '${DateTime.now().difference(dateTime).inMinutes} daqiqa avval';
//         } else {
//           return 'Biroz oldin';
//         }
//       }
//     } else if (differenceInDays < 7 && differenceInDays > 0) {
//       return '$differenceInDays kun avval';
//     } else if (differenceInDays >= 7 && differenceInDays < 30) {
//       return '${(differenceInDays / 7).floor()} hafta avval';
//     } else {
//       return '${(differenceInDays / 30).floor()} oy avval';
//     }
//   }
//
//   static String formatDateddMMMMyyyy(String date) =>
//       '${DateTime.parse(date).day}-${Maps.date[DateTime.parse(date).month]} ${DateTime.parse(date).year}';
//
//   static String getWhenAgoFromDate(String date) {
//     final postDate = DateTime.tryParse(date);
//     if (postDate == null) {
//       return '';
//     } else {
//       final difference = DateTime.now().difference(postDate);
//       if (difference.inSeconds < 60) {
//         return '${difference.inSeconds} soniya oldin';
//       } else if (difference.inMinutes < 60) {
//         return '${difference.inMinutes} daqiqa oldin';
//       } else if (difference.inHours < 24) {
//         return '${difference.inHours} soat oldin';
//       } else {
//         return '${difference.inDays} kun oldin';
//       }
//     }
//   }
//
//   static String formatDiscountedPrice(PriceREntity price, {required bool isForeign}) {
//     if (isForeign) {
//       return '${price.priceDiscount} USD';
//     } else {
//       final oldCost = StringBuffer(price.priceDiscount.toInt().toString());
//       final newCost = StringBuffer();
//
//       for (var i = 0; i < oldCost.length; i++) {
//         if ((oldCost.length - i) % 3 == 0) newCost.write(' ');
//         newCost.write(oldCost.toString()[i]);
//       }
//       return '$newCost UZS';
//     }
//   }
//
//   static Future<bool> getWhetherPermissionGranted() async {
//     try {
//       final geoPermission = await Geolocator.checkPermission();
//       if (geoPermission == LocationPermission.denied) {
//         await Geolocator.requestPermission();
//       }
//       if (geoPermission == LocationPermission.always || geoPermission == LocationPermission.whileInUse) {
//         return true;
//       } else {
//         throw Exception('Unable to get permission: $geoPermission');
//       }
//     } on Exception catch (e) {
//       throw Exception('Unable to get permission: ${e.toString()}');
//     }
//   }
//
//   static Future<Position> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     try {
//       serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     } catch (e) {
//       serviceEnabled = false;
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (!serviceEnabled || permission == LocationPermission.denied) {
//       permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//
//         if (permission == LocationPermission.denied) {
//           throw const ParsingException(errorMessage: 'location_permission_disabled');
//         }
//       }
//
//       if (permission == LocationPermission.deniedForever) {
//         permission = await Geolocator.requestPermission();
//
//         if (permission == LocationPermission.denied) {
//           throw const ParsingException(errorMessage: 'location_permission_disabled');
//         } else if (permission == LocationPermission.deniedForever) {
//           throw const ParsingException(errorMessage: 'location_permission_permanent_disabled');
//         }
//       }
//     }
//
//     return await Geolocator.getCurrentPosition();
//   }
//
//   static Future<PlacemarkIcon> getMarkerIcon() async => PlacemarkIcon.single(
//         PlacemarkIconStyle(
//           scale: 3,
//           anchor: const Offset(0.5, 0.8),
//           image: BitmapDescriptor.fromAssetImage(AppImages.marker),
//         ),
//       );
//
//   static String formatPhoneNumber(String value) {
//     final changeValue = value.replaceAll('-', '').replaceAll(' ', '').replaceAll('(', '').replaceAll(')', '');
//
//     return changeValue;
//   }
//
//   static String phoneFormat(String phone) {
//     final formattedPhone = StringBuffer();
//
//     if (phone.length == 9) {
//       //!input = 904781717
//       formattedPhone
//         ..write('${phone.substring(0, 2)} ')
//         ..write('${phone.substring(2, 5)} ')
//         ..write('${phone.substring(5, 7)} ')
//         ..write(phone.substring(7));
//
//       //!result 90 487 17 17
//     } else if (phone.length == 13) {
//       //!input = +998904781717
//       formattedPhone
//         ..write('${phone.substring(0, 4)} ')
//         ..write('${phone.substring(4, 6)} ')
//         ..write('${phone.substring(6, 9)} ')
//         ..write('${phone.substring(9, 11)} ')
//         ..write(phone.substring(11));
//
//       //!result +998 90 487-17-17
//     }
//     return formattedPhone.toString();
//   }
//
//   static CustomException getDioExceptionAsString({required DioException error}) {
//     if (error.type == DioExceptionType.connectionTimeout) {
//       return const CustomException(
//         message: 'Tarmoq bilan muammo yuz berdi. Iiltimos, internet sfatini tekshirib qaytadan urinib koʻring',
//         code: '100',
//       );
//     } else if (error.type == DioExceptionType.receiveTimeout) {
//       return const CustomException(
//         message: 'Malumot olishda muammo yuz berdi. Iltimos, qaytadan urinib koʻring',
//         code: '100',
//       );
//     } else if (error.type == DioExceptionType.sendTimeout) {
//       return const CustomException(
//         message: 'Malumot joʻnatishda muammo yuz berdi. Iltimos, qaytadan urinib koʻring',
//         code: '100',
//       );
//     } else {
//       return const CustomException(
//         message: 'Qurilmada xatolik yuz berdi. Ililtimos, qaytadan urinib koʻring',
//         code: '100',
//       );
//     }
//   }
//
//   static String getAvailableBookForms(BookSingleModel book) {
//     var str = '';
//     var hasPhysical = false;
//     var hasEType = false;
//     var hasAudio = false;
//     for (final price in book.children) {
//       if (price.type.compareTo('book') == 0) {
//         hasPhysical = true;
//       } else if (price.type.compareTo('audiobook') == 0) {
//         hasAudio = true;
//       } else if (price.type.compareTo('ebook') == 0) {
//         hasEType = true;
//       }
//     }
//     if (hasPhysical) {
//       str += "Qog'oz,";
//     }
//     if (hasEType) {
//       str += ' Elektron,';
//     }
//     if (hasAudio) {
//       str += ' Audio,';
//     }
//
//     return str;
//   }
//
//   static String formatyyyymmdd(final String date) {
//     try {
//       final parsedDate = Jiffy.parse(date).date;
//       final parsedYear = Jiffy.parse(date).year;
//       final parsedMonth = getMonths(Jiffy.parse(date).month);
//       return '$parsedDate-$parsedMonth $parsedYear';
//     } catch (e) {
//       return date;
//     }
//   }
//
//   static String getMonths(int month) {
//     switch (month) {
//       case 1:
//         return 'Yanvar';
//       case 2:
//         return 'Fevral';
//       case 3:
//         return 'Mart';
//       case 4:
//         return 'Aprel';
//       case 5:
//         return 'May';
//       case 6:
//         return 'Iyun';
//       case 7:
//         return 'Iyul';
//       case 8:
//         return 'Avgust';
//       case 9:
//         return 'Sentyabr';
//       case 10:
//         return 'Oktyabr';
//       case 11:
//         return 'Noyabr';
//       case 12:
//         return 'Dekabr';
//       default:
//         return '';
//     }
//   }
//
//   static String getFormattedPublishers(final List<PublisherEntity> publishers) {
//     final formattedString = StringBuffer();
//
//     for (var i = 0; i < publishers.length; i++) {
//       formattedString.write(publishers[i].title);
//       if (i != publishers.length - 1) {
//         formattedString.write(', ');
//       }
//     }
//     return formattedString.toString();
//   }
//
//   static String bookTypeEnumToReadableBookType(final String bookType) {
//     if (bookType.compareTo('book') == 0) {
//       return "Qog'oz talqin";
//     } else if (bookType.compareTo('audiobook') == 0) {
//       return 'audio talqin';
//     } else if (bookType.compareTo('ebook') == 0) {
//       return 'elektron talqin';
//     } else {
//       return '';
//     }
//   }
//
//   static String mapUserTypeToReadableType(final UserType user) {
//     switch (user) {
//       case UserType.me:
//         return 'Bu siz';
//       case UserType.author:
//         return 'Muallif';
//       case UserType.user:
//         return '';
//       default:
//         return '';
//     }
//   }
//
//   static String searchByCategory(final String type) {
//     switch (type) {
//       case 'sale':
//         return 'Super Chegirma';
//       case 'weekly':
//         return 'Haftalik TOP kitoblar';
//       case 'free':
//         return "Bepul kitoblar to'plami";
//       case 'audiobook':
//         return 'Ommabop audiokitoblar';
//       case 'price_des':
//         return 'Eng arzon kitoblar';
//       case 'price_asc':
//         return 'Eng qimmat kitoblar';
//       default:
//         return 'Bepul kitoblar';
//     }
//   }
//
//   static String getFormattedPhoneForProfile(String phone, [String prefix = '+998']) {
//     if (phone.length >= 13) {
//       if (prefix.isNotEmpty) {
//         return '$prefix (${phone.substring(4, 6)}) ${phone.substring(6, 9)}-${phone.substring(9, 11)}-${phone.substring(11, 13)}';
//       } else {
//         return '(${phone.substring(4, 6)}) ${phone.substring(6, 9)}-${phone.substring(9, 11)}-${phone.substring(11, 13)}';
//       }
//     } else {
//       return '';
//     }
//   }
//
//   static String getFragmentExtension(String fragmentUrl) {
//     if (fragmentUrl.isEmpty) {
//       return '';
//     }
//     final splittedStringList = fragmentUrl.split('.');
//     if (splittedStringList.isNotEmpty) {
//       return splittedStringList.last;
//     } else {
//       return '';
//     }
//   }
//
//   static bool checkIfFileIsEpub(String fragmentUrl) {
//     final extension = getFragmentExtension(fragmentUrl);
//     if (extension.compareTo('epub') == 0) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   static bool checkIfFileIsMp3(String fragmentUrl) {
//     final extension = getFragmentExtension(fragmentUrl);
//     if (extension.compareTo('mp3') == 0) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   static bool checkIfFileIsPdf(String fragmentUrl) {
//     final extension = getFragmentExtension(fragmentUrl);
//     if (extension.compareTo('pdf') == 0) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   static String mapEnumToFragmentButtonTitle(FragmentStatus status) {
//     switch (status) {
//       case FragmentStatus.FRAGMENT_INIT:
//         return '';
//       case FragmentStatus.FRAGMENT_IN_PROGRESS:
//         return '';
//       case FragmentStatus.FRAGMENT_DOES_NOT_EXIST:
//         return "Ko'chirish";
//       case FragmentStatus.FRAGMENT_AVAILABLE:
//         return "O'qish";
//       case FragmentStatus.FRAGMENT_FAILURE:
//         return "Keyinroq urinib ko'ring";
//       default:
//         return "Ko'chirish";
//     }
//   }
//
//   /// Generates a cryptographically secure random nonce, to be included in a
//   /// credential request.
//   static String generateNonce([int length = 32]) {
//     const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//     final random = Random.secure();
//     return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
//   }
//
//   /// Returns the sha256 hash of [input] in hex notation.
//   static String sha256ofString(String input) {
//     final bytes = utf8.encode(input);
//     final digest = sha256.convert(bytes);
//     return digest.toString();
//   }
//
//   static Future<dynamic> refresh({int duration = 0}) => Future.delayed(Duration(milliseconds: duration));
//
//   static String getCoverTitle(String cover) {
//     switch (cover) {
//       case 'soft':
//         return 'Yumshoq muqova';
//       case 'hard':
//         return 'Qattiq muqova';
//       default:
//         return '';
//     }
//   }
// }
