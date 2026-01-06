import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/features/random_quotes/presentation/manager/random_quote_cubit.dart';
import 'package:quotes_app/features/random_quotes/presentation/widgets/quote_content.dart';

class QuotesHomeBody extends StatelessWidget {
  const QuotesHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteSucsess) {
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
                child: QuoteContent(Quote: state.quote.quote),
              ),
            ),
          );
        } else if (state is RandomQuoteLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: Text('something went wrong'));
        }
      },
    );
  }
}
