import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';

import 'package:netflix/presentation/new_and_hot/widgets/comingsoonwidget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  late Future<List<Movie>> trendingmovie;
  @override
  void initState() {
    super.initState();
    trendingmovie = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(89),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(
                    color: kwhitecolor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
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
              bottom: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  labelColor: kblackcolor,
                  unselectedLabelColor: kwhitecolor,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kwhitecolor, borderRadius: kradius30),
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Tab(
                        text: "🍿 Coming Soon",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Tab(
                        text: "👀 Everyone's watching",
                      ),
                    )
                  ]),
            )),
        body: TabBarView(children: [
          _buildComingsoon(),
          _buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget _buildComingsoon() {
    return SizedBox(
      child: FutureBuilder(
          future: trendingmovie,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: RefreshProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, index) =>
                      ComingSoonWidget(
                        snapshot: snapshot,
                        index: index,
                      ));
            } else {
              return const Center(
                child: RefreshProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget _buildEveryonesWatching() {
    return SizedBox(
      child: FutureBuilder(
          future: trendingmovie,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: RefreshProgressIndicator(),
              );
            } else if(snapshot.hasData){
              return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (BuildContext context, index) =>
          EveryoneswatchingWidget(snapshot: snapshot,index: index,));
            }
            else{
              
              return const Center(
                child: RefreshProgressIndicator(),
              );
            }
          }),
    );
  }
}
