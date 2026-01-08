import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes_app/core/routing/app_router.dart';

class SplashScreenViewBody extends StatefulWidget {
  const SplashScreenViewBody({super.key});

  @override
  State<SplashScreenViewBody> createState() => _SplashScreenViewBodyState();
}

class _SplashScreenViewBodyState extends State<SplashScreenViewBody> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(AppRouter.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/quote/hdpi.png'));
  }
}
