import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/videowidgets.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
    required this.snapshot,
    required this.index,
  });
  final AsyncSnapshot snapshot;
  final int index;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Rating",
                style: TextStyle(fontSize: 12, color: kgreycolor),
              ),
              Text(
                "${snapshot.data[index].voteAverage}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWiget(
                snapshot: snapshot,
                index: index,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${snapshot.data![index].originalTitle}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 35,
                          letterSpacing: -4,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: "Remind me",
                        iconsize: 20,
                        textSize: 12,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: "Info",
                        iconsize: 20,
                        textSize: 12,
                      ),
                      kwidth
                    ],
                  ),
                ],
              ),
              kheight,
              Text("${snapshot.data![index].releseDate}"),
              kheight,
              Text(
                "${snapshot.data![index].title}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              kheight,
              Text(
                "${snapshot.data![index].overview}",
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: kgreycolor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
