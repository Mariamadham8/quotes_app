import '../../domain/entities/quote.dart';

class QuoteModel extends Quotes {
  const QuoteModel({required int id, required String quote})
    : super(id: id, quote: quote);

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['slip']['id'] ?? [],
      quote: json['slip']['advice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'quote': quote};
  }
}
