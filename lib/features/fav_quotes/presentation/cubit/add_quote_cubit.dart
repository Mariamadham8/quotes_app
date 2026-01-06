import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_quote_state.dart';

class AddQuoteCubit extends Cubit<AddQuoteState> {
  AddQuoteCubit() : super(AddQuoteInitial());
}
