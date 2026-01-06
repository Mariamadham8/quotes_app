import 'package:flutter/material.dart';

class QuoteContent extends StatelessWidget {
  final String? Quote;
  const QuoteContent({super.key, this.Quote});

  @override
  Widget build(BuildContext context) {
    final String? quote = Quote;
    return Center(
      child: Text(
        quote ?? 'nothing to show يا ابن العبيطه',
        softWrap: true,
        overflow: TextOverflow.visible,
        maxLines: null,
        style: TextStyle(color: Theme.of(context).colorScheme.surface),
      ),
    );
  }
}
