import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [const _smartDownloads(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    "https://media.themoviedb.org/t/p/w440_and_h660_face/dhVYlfMNc2bfXPB83LLL00I4l9n.jpg",
    "https://media.themoviedb.org/t/p/w440_and_h660_face/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg",
    "https://media.themoviedb.org/t/p/w440_and_h660_face/nhEtK1lJKb3kqBtDBDXynGr3hJL.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhitecolor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          "We will download a personalised selection of\n movies and shows for you, so there's\n always something to watch on your\n device",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(
          height: size.width,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * .38,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadsimageWidget(
                  imageList: imageList[0],
                  margin: const EdgeInsets.only(left: 170,top: 35),
                  angle: 25,
                  size: Size(size.width * 0.35, size.width * 0.55)),
              DownloadsimageWidget(
                  imageList: imageList[1],
                  margin: const EdgeInsets.only(right: 170,top: 35),
                  angle: -25,
                  size: Size(size.width * 0.35, size.width * 0.55)),
              DownloadsimageWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(bottom: 10),
                size: Size(size.width * 0.4, size.width * 0.6),
                radius: 5,
              )
            ],
          ),
        )
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Setup",
                style: TextStyle(
                    color: kwhitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kblackcolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          CupertinoIcons.settings,
          color: kwhitecolor,
        ),
        kwidth,
        Text("Smart Download")
      ],
    );
  }
}

class DownloadsimageWidget extends StatelessWidget {
  const DownloadsimageWidget(
      {super.key,
      required this.imageList,
      this.angle = 0,
      this.radius = 10,
      required this.margin,
      required this.size});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
         
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
