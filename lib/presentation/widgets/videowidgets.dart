import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class VideoWiget extends StatelessWidget {
  const VideoWiget({
    super.key, required this.snapshot, required this.index,
  });
  final AsyncSnapshot snapshot;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            "${Constatnts.ImagePath}${snapshot.data[index].backDroppath}"
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(.5),
            radius: 22,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  color: kwhitecolor,
                  size: 20,
                )),
          ),
        ),
      ],
    );
  }
}
