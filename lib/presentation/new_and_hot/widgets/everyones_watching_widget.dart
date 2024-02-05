import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/videowidgets.dart';

class EveryoneswatchingWidget extends StatelessWidget {
  const EveryoneswatchingWidget({
    super.key, required this.snapshot, required this.index,
  });
  final AsyncSnapshot snapshot;
  final int index;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          "${snapshot.data![index].title}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          "${snapshot.data![index].overview}",
          style: const TextStyle(color: kgreycolor),
        ),
        kheight50,
        VideoWiget(snapshot:snapshot,index: index,),
        kheight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
                icon: Icons.share, title: 'Share', iconsize: 25, textSize: 16),
            kwidth,
            CustomButtonWidget(
                icon: Icons.add, title: 'My List', iconsize: 25, textSize: 16),
            kwidth,
            CustomButtonWidget(
                icon: Icons.play_arrow,
                title: 'Play',
                iconsize: 25,
                textSize: 16),
            kwidth
          ],
        )
      ],
    );
  }
}
