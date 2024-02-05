import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
              currentIndex: newIndex,
              onTap: (index) {
                indexChangeNotifier.value  = index;
              },
              // elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.home,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.collections,
                    ),
                    label: 'New&Hot'),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.smiley,
                    ),
                    label: 'Fast Laughs'),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.search,
                    ),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.download_circle,
                    ),
                    label: 'Download'),
              ]);
        });
  }
}
