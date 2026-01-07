import 'package:flutter/material.dart';
import 'package:quotes_app/features/fav_quotes/presentation/widgets/fav_quote_body.dart';

class FavQuotes extends StatelessWidget {
  const FavQuotes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: FavQuoteBody()));
  }
}
