import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';
import 'package:netflix/presentation/search/widgets/title.dart';



class SearchResultwidget extends StatefulWidget {
  const SearchResultwidget({super.key});

  @override
  State<SearchResultwidget> createState() => _SearchResultwidgetState();
}

class _SearchResultwidgetState extends State<SearchResultwidget> {
  late Future<List<Movie>> resultMovie;
  @override
  void initState() {
    super.initState();
    resultMovie = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        FutureBuilder(
            future: resultMovie,
            builder: (context, snapshot){
              if (snapshot.hasError) {
                return const Center(
                  child: RefreshProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1 / 1.4,
                    children: List.generate(snapshot.data!.length, (index) {
                      return MainCard(
                          poster: Constatnts.ImagePath +
                              snapshot.data![index].posterPath);
                    }),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.poster});
  final String poster;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(poster), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
