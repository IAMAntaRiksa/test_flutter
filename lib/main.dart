import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/bloc/bloc/detail_movie_bloc.dart';
import 'package:test_flutter/bloc/cubit/buttom_nav_cubit.dart';
import 'package:test_flutter/bloc/movie_bloc.dart';
import 'package:test_flutter/bloc_opserver.dart';
import 'package:test_flutter/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(),
        ),
        BlocProvider<DetailMovieBloc>(
          create: (context) => DetailMovieBloc(),
        ),
        BlocProvider<ButtomNavCubit>(
          create: (context) => ButtomNavCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          canvasColor: Colors.grey.shade200,
        ),
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
