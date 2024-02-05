import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key, required this.title, required this.snapshot,
  });
  final String title;
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 Tv Shows In India Today '),
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => kwidth,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return NumberCard(index: index,snapshot: snapshot,);
            },
            // children: List.generate(
            //     10,
            //     (index) => NumberCard(
            //           index: index,
            //         )),
          ),
        )
      ],
    );
  }
}
