import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:onlineshop_77/generated/locale_keys.g.dart';
part 'mini_category_event.dart';
part 'mini_category_state.dart';

class MiniCategoryBloc extends Bloc<MiniCategoryEvent, MiniCategoryState> {
  MiniCategoryBloc() : super(MiniCategoryInitial(LocaleKeys.allPosts.tr())) {
    on<SetCategoryEvent>((event, emit) {
      emit(SelectCategory(event.category));
    });
  }
}
