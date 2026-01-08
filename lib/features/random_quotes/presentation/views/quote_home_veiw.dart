import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigetion_bar.dart';
import '../widgets/quotes_home-body.dart';

class QuotesHomeVeiw extends StatelessWidget {
  const QuotesHomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuotesHomeBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
