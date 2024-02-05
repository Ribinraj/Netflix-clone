import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constants.dart';

import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title, required this.snapshot,
  });
  final String title;
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context,index)=>kwidth,
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index){
              return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width:150,
                        height: 200,
                        child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            "${Constatnts.ImagePath}${snapshot.data[index].posterPath}"),
                      ),
                    );
            },
          ),
        )
      ],
    );
  }
}
