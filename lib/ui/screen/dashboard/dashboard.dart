import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/bloc/cubit/buttom_nav_cubit.dart';
import 'package:test_flutter/ui/screen/favorite/favorite.screen.dart';

import 'package:test_flutter/ui/screen/home/home_screen.dart';
import 'package:test_flutter/ui/screen/profile/profile_screen.dart';
import 'package:test_flutter/ui/screen/search/search_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _dashboardBodyWidgets = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtomNavCubit, ButtomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: _dashboardBodyWidgets[state.selectedIndexBody],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _mainMenuItems(),
            currentIndex: state.selectedIndexBody,
            onTap: (index) {
              context.read<ButtomNavCubit>().navigateTo(index);
            },
            showUnselectedLabels: false,
            showSelectedLabels: false,
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _mainMenuItems() {
    return <BottomNavigationBarItem>[
      _mainMenuItemWidget('Home', Icons.home),
      _mainMenuItemWidget('Search', Icons.search),
      _mainMenuItemWidget('Favorite', Icons.favorite),
      _mainMenuItemWidget('Profile', Icons.account_circle),
    ];
  }

  BottomNavigationBarItem _mainMenuItemWidget(
      String menuTitle, IconData iconData) {
    return BottomNavigationBarItem(
      activeIcon: Icon(iconData),
      icon: Icon(iconData),
      label: menuTitle,
    );
  }
}
