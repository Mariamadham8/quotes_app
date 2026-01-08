import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_app/core/constants/constants.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(ChangeLocaleState(Locale(Constants.englishCode)));

  //get saved langouage

  //change locale
}
