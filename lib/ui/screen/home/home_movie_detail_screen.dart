import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/bloc/bloc/detail_movie_bloc.dart';

class MovieDetailArguments {
  final String? id;
  final String? title;
  MovieDetailArguments({
    required this.id,
    required this.title,
  });
}

class HomeMovieDetailScreen extends StatelessWidget {
  final MovieDetailArguments args;

  const HomeMovieDetailScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  static const String routeName = '/movieDetail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title ?? ''),
      ),
      body: HomeDetailViewScreen(id: args.id ?? ''),
    );
  }
}

class HomeDetailViewScreen extends StatefulWidget {
  const HomeDetailViewScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  _HomeDetailViewScreenState createState() => _HomeDetailViewScreenState();
}

class _HomeDetailViewScreenState extends State<HomeDetailViewScreen> {
  @override
  void initState() {
    context.read<DetailMovieBloc>().add(GetDetailMovieEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      builder: (context, state) {
        if (state is DetailMovieLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DetailMovieLoadError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Icon(Icons.refresh)),
            ],
          );
        } else if (state is DetailMovieLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${state.result.id}',
                style: const TextStyle(fontSize: 34, color: Colors.black),
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
