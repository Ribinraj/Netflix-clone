import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import 'package:netflix/presentation/search/widgets/search_idle.dart';

import 'package:netflix/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final TextEditingController searchcontroller = TextEditingController();
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              controller: searchcontroller,
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: kwhitecolor),
              onTap: () {
                setState(() {
                  isTapped = true;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  isTapped = false;
                });
              },
            ),
            kheight,
            isTapped == true
                ? const Expanded(child: SearchIdle())
                : const Expanded(child: SearchResultwidget())
          ],
        ),
      )),
    ));
  }
}
