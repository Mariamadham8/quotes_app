import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/constantDialogs.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) {
        setState(() {
          _currentIndex = i;
        });

        switch (i) {
          case 0:
            context.push(AppRouter.home);
            print("Refresh tapped");
            break;
          case 1:
            context.push(AppRouter.favQuotes);
            break;
          case 2:
            ConstantDialogs.ShowErrorDialog(
              context: context,
              msg: 'quote has been saved',
            );
            break;
        }
      },
      itemPadding: EdgeInsets.all(8),
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.change_circle_outlined),
          title: Text("Refresh"),
          selectedColor: Theme.of(context).colorScheme.primary,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.favorite),
          title: Text("Likes"),
          selectedColor: Theme.of(context).colorScheme.secondary,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.save, size: 24),
          title: Text("Save"),
          selectedColor: Theme.of(context).colorScheme.onTertiary,
        ),
      ],
    );
  }
}
