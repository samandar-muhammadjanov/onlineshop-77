part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final FormzSubmissionStatus status;
  final List<CategoriesEntity> categories;

  const CategoriesState({
    this.status = FormzSubmissionStatus.initial,
    this.categories = const [],
  });

  CategoriesState copyWith({
    FormzSubmissionStatus? status,
    List<CategoriesEntity>? categories,
  }) =>
      CategoriesState(
        status: status ?? this.status,
        categories: categories ?? this.categories,
      );

  @override
  List<Object?> get props => [
        status,
        categories,
      ];
}
