import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constants.dart';

import 'package:netflix/presentation/widgets/main_title.dart';

class CaroselMainTitleCard extends StatelessWidget {
  const CaroselMainTitleCard({
    super.key,
    required this.title,
    required this.snapshot,
  });
  final String title;
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: snapshot.data!.length,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: .4,
                pageSnapping: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 1)),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width:150,
                        height: 200,
                        child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            "${Constatnts.ImagePath}${snapshot.data[itemIndex].posterPath}"),
                      ),
                    );
        
            },
          ),
        )
      ],
    );
  }
}
