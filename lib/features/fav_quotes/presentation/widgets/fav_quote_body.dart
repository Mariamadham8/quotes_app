import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/features/fav_quotes/presentation/cubit/add_quote_cubit.dart';
import 'package:quotes_app/features/fav_quotes/presentation/widgets/fav_qoute_listview_item.dart';
import 'package:quotes_app/features/random_quotes/domain/entities/quote.dart';

class FavQuoteBody extends StatelessWidget {
  const FavQuoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddQuoteCubit, List<Quotes>>(
      builder: (context, favList) {
        return ListView.builder(
          itemCount: favList.length,
          itemBuilder: (context, index) {
            return FavQuotesListviewItem(favQuoteContent: favList[index]);
          },
        );
      },
    );
  }
}
