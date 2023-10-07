class AuthParams {
  final String fullName;
  final String projectName;
  final int categoryId;
  final String phoneNumber;
  final String address;

  AuthParams({
    required this.fullName,
    required this.projectName,
    required this.categoryId,
    required this.phoneNumber,
    required this.address,
  });
}

class LoginParams {
  final String login;
  final String password;

  LoginParams({
    required this.login,
    required this.password,
  });
}

class AdsParams {
  final String name;
  final int category;
  final String description;
  final int price;
  final String currency;
  final String address;
  final List<String> imgList;

  AdsParams({
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.currency,
    required this.address,
    required this.imgList,
  });
}
