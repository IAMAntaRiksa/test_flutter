import 'package:flutter/material.dart';
import 'package:test_flutter/ui/screen/search/search_view_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/search';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SearchViewScreen(),
      ),
    );
  }
}
