

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/quote.dart';
import '../repos/get_random_quote.dart';

class GetRandomQuote implements Usecase<Quotes,NoParams>{
  final QuoteRepo quoteRepo;

  GetRandomQuote(this.quoteRepo);

  @override
  Future<Either<Failure, Quotes>> call(NoParams param) {
    return quoteRepo.getRandomQuote();
  }

  //if there is an parameter then i will make a class etends from Equatble here and make it the type of params of this usecase

    
  }
