import 'package:flutter/material.dart';
import 'package:test_flutter/ui/screen/dashboard/dashboard.dart';
import 'package:test_flutter/ui/screen/favorite/favorite.screen.dart';
import 'package:test_flutter/ui/screen/profile/profile_screen.dart';
import 'package:test_flutter/ui/screen/search/search_screen.dart';
import 'package:test_flutter/ui/screen/splashscreen/splash_screen.dart';
import '../ui/screen/home/home_movie_detail_screen.dart';

class Routes {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case DashboardScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case SearchScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case FavoriteScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case HomeMovieDetailScreen.routeName:
        var movieArgs = settings.arguments as MovieDetailArguments;
        return MaterialPageRoute(
          builder: (_) => HomeMovieDetailScreen(args: movieArgs),
        );
    }
    return null;
  }
}
