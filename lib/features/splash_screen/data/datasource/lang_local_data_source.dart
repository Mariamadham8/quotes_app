import 'package:dartz/dartz.dart';
import 'package:quotes_app/core/constants/constants.dart';
import 'package:quotes_app/core/error/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LnagLocalDataSource {
  Future<bool> changelang({required String langCode});

  Future<String> getSavedLang();
}

class LangLocalDataSourceImpl implements LnagLocalDataSource {
  SharedPreferences sharedPreferences;
  LangLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<bool> changelang({required String langCode}) async {
    return await sharedPreferences.setString(Constants.localeCode, langCode);
  }

  @override
  Future<String> getSavedLang() {
    final langCode = sharedPreferences.getString(Constants.localeCode);
    if (langCode != null) {
      return Future.value(langCode);
    } else {
      return Future.value(Constants.englishCode);
    }
  }
}
