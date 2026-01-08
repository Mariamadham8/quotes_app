import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_app/core/constants/constants.dart';
import 'package:quotes_app/core/usecases/usecase.dart';
import 'package:quotes_app/features/splash_screen/domain/usecases/get_saved_lang.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUsecase getSavedLangUsecase;

  LocaleCubit({required this.getSavedLangUsecase})
    : super(ChangeLocaleState(Locale(Constants.englishCode)));

  //get saved langouage
  Future<void> getSavedLang() async {
    final either = await getSavedLangUsecase.call(NoParams());
    either.fold(
      (failure) {
        //emit failure state
        emit(ChangeLocaleState(Locale(Constants.englishCode)));
      },
      (langCode) {
        //emit success state
        emit(ChangeLocaleState(Locale(langCode)));
      },
    );
  }

  //change locale
  Future<void> changelang(String langCode) async {
    if (langCode == Constants.englishCode) {
      emit(ChangeLocaleState(Locale(Constants.englishCode)));
    } else {
      emit(ChangeLocaleState(Locale(Constants.arabicCode)));
    }
  }
}
