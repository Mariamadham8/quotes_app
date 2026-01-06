

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/quote.dart';

//domain layer act as interface
abstract class QuoteRepo{
  Future<Either<Failure, Quotes>> getRandomQuote();
}