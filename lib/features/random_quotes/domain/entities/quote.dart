import 'package:equatable/equatable.dart';

class Quotes extends Equatable {

  final int id;
  final String quote;

  const Quotes({required this.id, required this.quote});
  @override
  List<Object?> get props => [
    id,
    quote,
  ];

}