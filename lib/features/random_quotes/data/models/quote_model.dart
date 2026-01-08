import '../../domain/entities/quote.dart';

class QuoteModel extends Quotes {
  const QuoteModel({required int id, required String quote})
    : super(id: id, quote: quote);

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('slip')) {
      final slip = json['slip'];
      return QuoteModel(id: slip['id'] ?? 0, quote: slip['advice'] ?? '');
    }

    return QuoteModel(id: json['id'] ?? 0, quote: json['quote'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'quote': quote};
  }
}
