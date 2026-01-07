import 'package:flutter/material.dart';

import 'package:quotes_app/features/random_quotes/domain/entities/quote.dart';

import 'package:quotes_app/features/random_quotes/presentation/widgets/quote_content.dart';

class FavQuotesListviewItem extends StatelessWidget {
  final Quotes favQuoteContent;
  const FavQuotesListviewItem({super.key, required this.favQuoteContent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.onSurface,
            shape: BoxShape.rectangle,
          ),
          alignment: Alignment.center,
          child: QuoteContent(Quote: favQuoteContent.quote),
        ),
      ),
    );
  }
}
