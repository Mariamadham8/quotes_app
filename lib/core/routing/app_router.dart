import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_app/core/di/service_locator.dart';
import 'package:quotes_app/features/fav_quotes/presentation/cubit/add_quote_cubit.dart';
import '../../features/fav_quotes/presentation/views/fav_quotes.dart';
import '../../features/random_quotes/presentation/manager/random_quote_cubit.dart';
import '../../features/random_quotes/presentation/views/quote_home_veiw.dart';

class AppRouter {
  static String home = '/';
  static String favQuotes = '/fav_quotes';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<RandomQuoteCubit>()..fetchRandomQuote(),
            ),
          ],
          child: QuotesHomeVeiw(),
        ),
      ),
      GoRoute(path: '/fav_quotes', builder: (context, state) => FavQuotes()),
    ],
  );
}
