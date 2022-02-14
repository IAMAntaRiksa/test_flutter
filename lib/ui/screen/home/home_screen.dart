import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_flutter/bloc/movie_bloc.dart';
import 'package:test_flutter/ui/screen/home/home_movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController textEditingController = TextEditingController();
  TabController? _tabController;

  void _listener() {
    context.read<MovieBloc>().add(
          SearchMovieEvent(search: textEditingController.text),
        );
  }

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    context.read<MovieBloc>().add(GetMovieEvent());
    textEditingController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _bodyHome(),
      ),
    );
  }

  Widget _bodyHome() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  width: 300,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0.8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: SvgPicture.asset('assets/splash/search.svg'),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(0.8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.open_with_outlined),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          tabBarControlleHome(tabController: _tabController),
        ],
      ),
    );
  }
}

Widget tabBarControlleHome({required TabController? tabController}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          controller: tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          tabs: const [
            Text('Movies', style: TextStyle(fontSize: 17)),
            Text('TV', style: TextStyle(fontSize: 17)),
            Text('News', style: TextStyle(fontSize: 17)),
            Text('Box Office', style: TextStyle(fontSize: 17)),
            Text('Floor', style: TextStyle(fontSize: 17)),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MovieLoadError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Icon(Icons.refresh)),
                  ],
                );
              } else if (state is MovieLoaded) {
                return TabBarView(
                  controller: tabController,
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.result.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              HomeMovieDetailScreen.routeName,
                              arguments: MovieDetailArguments(
                                id: state.result[index].id,
                                title: state.result[index].title,
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 20),
                                      child: CachedNetworkImage(
                                        imageUrl: state
                                                    .result[index].image.url ==
                                                null
                                            ? ''
                                            : state.result[index].image.url ??
                                                '',
                                        height: 150,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 25),
                                      Text(
                                        state.result[index].title ?? '',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      RichText(
                                        text: TextSpan(
                                          text: 'by ',
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    '${state.result[index].id}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        '${state.result[index].year}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                        maxLines: 5,
                                      ),
                                      const SizedBox(height: 25),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const Center(
                        child: Text('Chair', style: TextStyle(fontSize: 20))),
                    const Center(
                        child: Text('Table', style: TextStyle(fontSize: 20))),
                    const Center(
                        child: Text('lamp', style: TextStyle(fontSize: 20))),
                    const Center(
                        child: Text('Floor', style: TextStyle(fontSize: 20))),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
//
            },
          ),
        )
      ],
    ),
  );
}
