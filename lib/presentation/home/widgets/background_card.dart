import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(kmainimage))),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  title: "My List",
                  icon: Icons.add,
                  iconsize: 30,
                  textSize: 18,
                ),
                _playButton(),
                const CustomButtonWidget(
                  icon: Icons.info,
                  title: "Info",
                  iconsize: 30,
                  textSize: 18,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        onPressed: () {},
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(kwhitecolor)),
        icon: const Icon(
          Icons.play_arrow,
          color: kblackcolor,
          size: 30,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:
              Text('play', style: TextStyle(fontSize: 20, color: kblackcolor)),
        ));
  }
}
