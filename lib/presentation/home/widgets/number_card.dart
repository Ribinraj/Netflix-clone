import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.snapshot});
  final int index;
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 200,
            ),
            ClipRRect(
              child: SizedBox(
                width: 130,
                height: 200,
                child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    "${Constatnts.ImagePath}${snapshot.data[index].posterPath}"),

                // decoration: BoxDecoration(
                //   borderRadius: kradius10,
                //   image: const DecorationImage(
                //     fit: BoxFit.cover,
                //     image: NetworkImage(
                //         "https://media.themoviedb.org/t/p/w440_and_h660_face/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg"),
                //   ),
                // ),
              ),
            ),
          ],
        ),
        Positioned(
            left: 13,
            bottom: -30,
            child: BorderedText(
              strokeWidth: 8,
              strokeColor: kwhitecolor,
              child: Text(
                "${index + 1}",
                style: const TextStyle(
                    fontSize: 140,
                    color: kblackcolor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ))
      ],
    );
  }
}
