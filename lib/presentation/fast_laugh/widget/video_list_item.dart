import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  VideoPlayerController? playerController;
  bool isvolumeOn = true;
  @override
  void initState() {
    super.initState();
    setState(() {
      playerController =
          VideoPlayerController.networkUrl(Uri.parse(videoList[widget.index]));
    });
    playerController!.initialize();
    playerController!.play();
    playerController!.setVolume(4);
    playerController!.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    playerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
         child: VideoPlayer(playerController!),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //leftside
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(.5),
                  radius: 30,
                  child:  InkWell(
        onTap: () {
          setState(() {
            isvolumeOn == false
                ? playerController!.setVolume(4)
                : playerController!.setVolume(0);
            isvolumeOn = !isvolumeOn;
          });
        },
        child: isvolumeOn
            ? const Icon(
                CupertinoIcons.volume_up,
                color: kwhitecolor,
                size: 30,
              )
            : const Icon(
                CupertinoIcons.volume_off,
                color: kwhitecolor,
                size: 30,
              ),
      ),
                ),
                //rightside
                 Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://media.themoviedb.org/t/p/w440_and_h660_face/dhVYlfMNc2bfXPB83LLL00I4l9n.jpg"),
                      ),
                    ),
                    const VideoActionWidgets(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    const VideoActionWidgets(icon: Icons.add, title: 'My List'),
                    const VideoActionWidgets(icon: Icons.share, title: 'Share'),
                   VideoPlayButton(playerController: playerController!)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidgets extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidgets(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: kwhitecolor, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class VideoPlayButton extends StatefulWidget {
  const VideoPlayButton({
    super.key,
    required this.playerController,
  });
  final VideoPlayerController playerController;

  @override
  State<VideoPlayButton> createState() => _VideoPlayButtonState();
}

class _VideoPlayButtonState extends State<VideoPlayButton> {
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (isPlay) {
                    widget.playerController.pause();
                  } else {
                    widget.playerController.play();
                  }
                });
                isPlay = !isPlay;
              },
              icon: isPlay
                  ? const Icon(
                      CupertinoIcons.pause_fill,
                      color:kwhitecolor,
                      size: 30,
                    )
                  : const Icon(
                      CupertinoIcons.play_fill,
                      color:kwhitecolor,
                      size: 30,
                    )),
          isPlay
              ? const Text(
                  "Pause",
                  style: TextStyle(fontSize: 16,),
                )
              : const Text(
                  "Play",
                  style: TextStyle(fontSize: 16,),
                )
        ],
      ),
    );
  }
}