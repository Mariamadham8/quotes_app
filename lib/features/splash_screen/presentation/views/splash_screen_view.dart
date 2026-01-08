import 'package:flutter/material.dart';
import 'package:quotes_app/features/splash_screen/presentation/widgets/splash_screen_view_body.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SplashScreenViewBody()));
  }
}
