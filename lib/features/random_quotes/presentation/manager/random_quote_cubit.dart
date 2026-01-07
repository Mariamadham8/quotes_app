import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/quote.dart';
import '../../domain/usecases/get_random_quote.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuote;
  RandomQuoteCubit(this.getRandomQuote) : super(RandomQuoteInitial());

  Future<void> fetchRandomQuote() async {
    emit(RandomQuoteLoading());
    final res = await getRandomQuote.call(NoParams());
    res.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(RandomQuoteFailure(errmessage: failure.errmessage));
        } else if (failure is CacheFailure) {
          emit(RandomQuoteFailure(errmessage: "Cache Failure"));
        } else {
          emit(RandomQuoteFailure(errmessage: "Unexpected Error"));
        }
      },
      (quote) {
        emit(RandomQuoteSucsess(quote: quote));
      },
    );
  }

  Future<void> fetchFavQuote() async {
    emit(RandomQuoteLoading());
    final res = await getRandomQuote.call(NoParams());
    res.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(RandomQuoteFailure(errmessage: failure.errmessage));
        } else if (failure is CacheFailure) {
          emit(RandomQuoteFailure(errmessage: "Cache Failure"));
        } else {
          emit(RandomQuoteFailure(errmessage: "Unexpected Error"));
        }
      },
      (quote) {
        emit(RandomQuoteSucsess(quote: quote));
      },
    );
  }
}
