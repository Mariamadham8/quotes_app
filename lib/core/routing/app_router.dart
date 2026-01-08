import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_app/core/di/service_locator.dart';
import 'package:quotes_app/features/fav_quotes/presentation/cubit/add_quote_cubit.dart';
import 'package:quotes_app/features/splash_screen/presentation/views/splash_screen_view.dart';
import '../../features/fav_quotes/presentation/views/fav_quotes.dart';
import '../../features/random_quotes/presentation/manager/random_quote_cubit.dart';
import '../../features/random_quotes/presentation/views/quote_home_veiw.dart';

class AppRouter {
  static String home = '/home';
  static String favQuotes = '/fav_quotes';
  static String SplahScreen = '/';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/home',
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

      GoRoute(path: '/', builder: (context, state) => SplashScreenView()),
    ],
  );
}
