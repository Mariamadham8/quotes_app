import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/api/end_point.dart';
import '../../../../core/error/exception.dart';
import '../models/quote_model.dart';

abstract class RandomQuoteRemoteDatasource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDatasourceImpl implements RandomQuoteRemoteDatasource {
  final Dio dio;
  RandomQuoteRemoteDatasourceImpl({required this.dio});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final res = await dio.get(
      EndPoint.randomQuoteEndPoint,
      options: Options(responseType: ResponseType.json),
    );
    if (res.statusCode == 200) {
      json.decode(res.data);
      final Map<String, dynamic> data = res.data is String
          ? json.decode(res.data)
          : res.data;
      return QuoteModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
