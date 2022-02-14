import 'package:flutter/material.dart';
import 'package:test_flutter/ui/screen/favorite/favorite_view_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static const String routeName = '/favorite';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: FavoriteViewScreen(),
      ),
    );
  }
}
