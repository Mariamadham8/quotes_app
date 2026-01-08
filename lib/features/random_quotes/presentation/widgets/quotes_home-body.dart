import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_app/core/routing/app_router.dart';
import 'package:quotes_app/features/fav_quotes/presentation/cubit/add_quote_cubit.dart';
import 'package:quotes_app/features/random_quotes/data/models/quote_model.dart';
import 'package:quotes_app/features/random_quotes/domain/entities/quote.dart';
import 'package:quotes_app/features/random_quotes/presentation/manager/random_quote_cubit.dart';
import 'package:quotes_app/features/random_quotes/presentation/widgets/quote_content.dart';

class QuotesHomeBody extends StatefulWidget {
  const QuotesHomeBody({super.key});

  @override
  State<QuotesHomeBody> createState() => _QuotesHomeBodyState();
}

class _QuotesHomeBodyState extends State<QuotesHomeBody> {
  bool isclicked = false;
  List<String> Quotes = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteSucsess) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Stack(
                children: [
                  Image.asset('assets/AppBackground.jpg'),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.onSurface,
                      shape: BoxShape.rectangle,
                    ),
                    alignment: Alignment.center,
                    child: QuoteContent(Quote: state.quote.quote),
                  ),
                  Positioned(
                    right: 2,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isclicked = !isclicked;
                          if (isclicked) {
                            context.read<AddQuoteCubit>().toggleFavorite(
                              state.quote,
                            );
                          }
                        });
                      },
                      icon: Icon(
                        isclicked
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: isclicked ? Colors.red : null,
                      ),
                    ),
                  ),
                ],
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
