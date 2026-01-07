import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_app/features/random_quotes/domain/entities/quote.dart';

part 'add_quote_state.dart';

class AddQuoteCubit extends Cubit<List<Quotes>> {
  AddQuoteCubit() : super([]);

  void toggleFavorite(Quotes quote) {
    final exists = state.any((q) => q.id == quote.id);

    if (exists) {
      emit(state.where((q) => q.id != quote.id).toList());
    } else {
      emit([...state, quote]);
    }
  }
}
