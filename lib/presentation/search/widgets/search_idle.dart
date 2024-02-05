import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

class SearchIdle extends StatefulWidget {
  const SearchIdle({super.key});

  @override
  State<SearchIdle> createState() => _SearchIdleState();
}

class _SearchIdleState extends State<SearchIdle> {
  late Future<List<Movie>> trendingmovies;
  @override
  void initState() {
    super.initState();
    trendingmovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kheight,
        Expanded(
            child: FutureBuilder(
                future: trendingmovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: RefreshProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => TopSearchItemTile(
                            snapshot: snapshot,
                            index: index,
                            title: snapshot.data![index].title,
                            movieposter: Constatnts.ImagePath +
                                snapshot.data![index].backDroppath),
                        separatorBuilder: (context, index) => kheight20,
                        itemCount:snapshot.data!.length);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }))
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile(
      {super.key,
      required this.snapshot,
      required this.index,
      required this.title,
      required this.movieposter});
  final AsyncSnapshot snapshot;
  final int index;
  final String title;
  final String movieposter;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(movieposter), fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                color: kwhitecolor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhitecolor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kblackcolor,
            radius: 23,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: kwhitecolor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
