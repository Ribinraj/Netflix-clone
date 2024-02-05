import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCards extends StatelessWidget {
  const MainCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kradius10,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://media.themoviedb.org/t/p/w440_and_h660_face/4kWGZYrTqBRsPIsnZmV3DzJtTi9.jpg"),
        ),
      ),
    );
  }
}
