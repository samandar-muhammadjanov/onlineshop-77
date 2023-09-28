part of 'user_product_bloc.dart';

@immutable
sealed class UserProductEvent {}

class GetUserProducts extends UserProductEvent {}
