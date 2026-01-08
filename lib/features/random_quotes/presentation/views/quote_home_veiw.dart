import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/core/config/locale/app_localizations.dart';
import 'package:quotes_app/features/splash_screen/presentation/manger/cubit/locale_cubit.dart';

import '../widgets/custom_bottom_navigetion_bar.dart';
import '../widgets/quotes_home-body.dart';

class QuotesHomeVeiw extends StatelessWidget {
  const QuotesHomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(
        icon: const Icon(Icons.translate_outlined),
        onPressed: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            BlocProvider.of<LocaleCubit>(context).changelang('ar');
          } else {
            BlocProvider.of<LocaleCubit>(context).changelang('en');
          }
        },
      ),
      title: Text(AppLocalizations.of(context)!.translate('random_quotes')!),
    );
    return Scaffold(
      appBar: appBar,

      body: QuotesHomeBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
