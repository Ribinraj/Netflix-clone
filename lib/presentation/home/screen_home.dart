import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/api/api.dart';

import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/carosel.dart';

import 'package:netflix/presentation/home/widgets/number_title_card.dart';

import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topratingMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> top10series;
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topratingMovies = Api().getTopratedMovies();
    upcomingMovies = Api().getupcomingMovies();
    popularMovies = Api().getpopularMovies();
    top10series = Api().gettop10series();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;

              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else {
                if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    const BackgroundCard(),
                    SizedBox(
                      child: FutureBuilder(
                          future: trendingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData) {
                              return CaroselMainTitleCard(
                                title: 'Trending Now',
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    kheight,
                    SizedBox(
                      child: FutureBuilder(
                          future: topratingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData) {
                              return MainTitleCard(
                                title: 'Top rated Movies',
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    kheight,
                      SizedBox(
                      child: FutureBuilder(
                          future: top10series,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData) {
                              return NumberTitleCard(title: 'Top 10 Series', snapshot: snapshot);
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    kheight,
                    SizedBox(
                      child: FutureBuilder(
                          future: upcomingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData) {
                              return MainTitleCard(
                                title: 'Upcoming Movies',
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    kheight,
                    SizedBox(
                      child: FutureBuilder(
                          future: popularMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData) {
                              return MainTitleCard(
                                title: 'Popular Movies',
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),
                    kheight
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 2000),
                        width: double.infinity,
                        height: 100,
                        color: Colors.black.withOpacity(.2),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/7/7a/Logonetflix.png",
                                  height: 70,
                                  width: 100,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                ),
                                kwidth,
                                Container(
                                  width: 25,
                                  height: 25,
                                  color: Colors.blue,
                                ),
                                kwidth
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "TV Shows",
                                  style: kHomeTitletext,
                                ),
                                Text(
                                  "Movies",
                                  style: kHomeTitletext,
                                ),
                                Text(
                                  "Categories",
                                  style: kHomeTitletext,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight,
              ],
            ),
          );
        },
      ),
    );
  }
}
