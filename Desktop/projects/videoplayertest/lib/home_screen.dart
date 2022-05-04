import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:videoplayertest/video/video_bloc.dart';
import 'package:videoplayertest/video/video_event.dart';
import 'package:videoplayertest/video/video_state.dart';

var vidUrl =
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late BetterPlayerController _betterPlayerController;
  // @override
  // void initState() {
  //   super.initState();
  //   BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
  //       BetterPlayerDataSourceType.network,
  //       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
  //   _betterPlayerController = BetterPlayerController(
  //     BetterPlayerConfiguration(
  //         overlay: Opacity(
  //       opacity: 0.2,
  //       child: Marquee(
  //         text: 'user name    email@gmail.com',
  //         blankSpace: 300,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //       ),
  //     )),
  //     betterPlayerDataSource: betterPlayerDataSource,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // BlocBuilder<VideoBloc, VideoState>(
            //   builder: (context, state) {
            //     if (state is VideoLoading) {
            //       return Expanded(
            //         flex: 4,
            //         child: Center(child: CircularProgressIndicator()),
            //       );
            //     } else if (state is VideoLoaded) {
            //       return Expanded(
            //         flex: 4,
            //         child: BetterPlayer(
            //           controller: state.controller,
            //         ),
            //       );
            //     }
            //     return Expanded(
            //       flex: 4,
            //       child: Center(
            //         child: Text('something went wrong'),
            //       ),
            //     );
            //   },
            // ),
            BlocBuilder<VideoBloc, VideoState>(
              builder: (context, state) {
                var key = UniqueKey();
                return VideoView(key, state.url);
              },
            ),
            const Expanded(flex: 6, child: LessionsTabView())
          ],
        ),
      ),
    );
  }
}

class LessionsTabView extends StatelessWidget {
  const LessionsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: ((context, index) {
              return Card(
                color: Colors.grey.shade300,
                child: ListTile(
                  leading: const Icon(Icons.lock_open),
                  title: Text(
                    'Lession ${index + 1}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: const Text('10:05 min'),
                  onTap: () {
                    context.read<VideoBloc>().add(NextVideo(vidUrl));
                  },
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

// class VideoItem extends StatefulWidget {
//   VideoItem({Key? key}) : super(key: key);

//   @override
//   State<VideoItem> createState() => _VideoItemState();
// }

// class _VideoItemState extends State<VideoItem> {
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 16 / 9,
//       child: BetterPlayer.network(
//         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//         betterPlayerConfiguration: const BetterPlayerConfiguration(
//           aspectRatio: 16 / 9,
//         ),
//       ),
//     );
//   }
// }

class VideoView extends StatefulWidget {
  final String url;

  final UniqueKey newKey;
  VideoView(this.newKey, this.url) : super(key: newKey);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late final VideoBloc videoBloc;
  @override
  void initState() {
    videoBloc = VideoBloc();
    super.initState();
  }

  @override
  void dispose() {
    videoBloc.close();
    super.dispose();
  }

  // late BetterPlayerController _betterPlayerController;
  // @override
  // void initState() {
  //   super.initState();
  //   BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
  //       BetterPlayerDataSourceType.network,
  //       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
  //   _betterPlayerController = BetterPlayerController(
  //     BetterPlayerConfiguration(
  //         overlay: Opacity(
  //       opacity: 0.2,
  //       child: Marquee(
  //         text: 'user name    email@gmail.com',
  //         blankSpace: 300,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //       ),
  //     )),
  //     betterPlayerDataSource: betterPlayerDataSource,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        return BetterPlayer.network(widget.url);
      },
    );
  }
}
