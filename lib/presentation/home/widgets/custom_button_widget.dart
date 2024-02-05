import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title, required this.iconsize, required this.textSize,
  });
  final IconData icon;
  final String title;
  final double iconsize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhitecolor,
          size: iconsize,
        ),
        Text(
          title,
          style:  TextStyle(fontSize: textSize),
        )
      ],
    );
  }
}
