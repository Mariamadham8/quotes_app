import 'dart:convert';

import 'package:quotes_app/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/constants.dart';
import '../models/quote_model.dart';

abstract class RandomQuoteLocalDatasource {
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDatasourceImpl implements RandomQuoteLocalDatasource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDatasourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
      Constants.chechedRandomQuote,
      json.encode(quote.toJson()),
    );
  }

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString = sharedPreferences.getString(
      Constants.chechedRandomQuote,
    );
    if (jsonString != null) {
      final cacheRandomQuote = Future.value(
        QuoteModel.fromJson(json.decode(jsonString)),
      );
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }
}
