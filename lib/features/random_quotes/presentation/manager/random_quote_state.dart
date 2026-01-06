part of 'random_quote_cubit.dart';

sealed class RandomQuoteState extends Equatable {
  const RandomQuoteState();
}

final class RandomQuoteInitial extends RandomQuoteState {
  @override
  List<Object> get props => [];

}

final class RandomQuoteLoading extends RandomQuoteState {
  @override
  List<Object> get props => [];

}

final class RandomQuoteSucsess extends RandomQuoteState {
  final Quotes quote;

  const RandomQuoteSucsess({required this.quote});
  @override
  List<Object> get props => [quote];

}

final class RandomQuoteFailure extends RandomQuoteState {
  final String  errmessage;

  RandomQuoteFailure({required this.errmessage});
  @override
  List<Object> get props => [errmessage];

}



