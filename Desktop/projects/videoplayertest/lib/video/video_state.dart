import 'package:better_player/better_player.dart';
import 'package:equatable/equatable.dart';

class VideoState {
  final String url;
  VideoState(this.url);
  factory VideoState.empty() {
    return VideoState('');
  }
  VideoState copyWith({String? url}) {
    return VideoState(url ?? this.url);
  }
}
// abstract class VideoState extends Equatable {
//   const VideoState();
//   @override
//   List<Object?> get props => [];
// }
// class VideoLoading extends VideoState{}
// class VideoL
// abstract class VideoState extends Equatable {
//    String url;
 
//   @override
//   List<Object?> get props => [];
// }

// class VideoLoading extends VideoState {}

// class VideoLoaded extends VideoState {
//   final BetterPlayerController controller;
//   const VideoLoaded(this.controller);
//   @override
//   List<Object?> get props => [controller];
// }

// class VideoError extends VideoState {}
// class VideoState {
//   late BetterPlayerController bcontroller;
//   late bool loaded;
//   VideoState._({
//     required this.bcontroller,
//     required this.loaded,
//     // required this.controlsVisible,
//     // required this.controlsVisiblePrevious,
//     // required this.playing,
//     // required this.volume,
//     // required this.volumeBeforeMute,
//   });

//   VideoState.initialize({
//     required String url,
//     // required bool autoPlay,
//     // required bool controlsVisible,
//   }) {
//     BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
//       BetterPlayerDataSourceType.network,
//       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//     );
//     bcontroller = BetterPlayerController(
//       BetterPlayerConfiguration(
//           overlay: Opacity(
//         opacity: 0.2,
//         child: Marquee(
//           text: 'user name    email@gmail.com',
//           blankSpace: 300,
//           crossAxisAlignment: CrossAxisAlignment.center,
//         ),
//       )),
//       betterPlayerDataSource: betterPlayerDataSource,
//     );
//     // return VideoState._(
//     //   loaded: loaded,
//     //   bcontroller: bcontroller,
//     // );
//     // final controller = VideoPlayerController.network(
//     //   url,
//     // );
//     // return VideoState._(
//     //   controller: controller,
//     //   loaded: false,
//     //   controlsVisible: controlsVisible,
//     //   controlsVisiblePrevious: controlsVisible,
//     //   playing: autoPlay,
//     //   volume: controller.value.volume,
//     //   volumeBeforeMute: controller.value.volume,
//     // );
//   }

//   // final VideoPlayerController controller;

//   // final bool controlsVisible;
//   // final bool controlsVisiblePrevious;
//   // final bool playing;
//   // final double volume;
//   // final double volumeBeforeMute;

//   bool get notLoaded => !loaded;
//   // bool get visibilityChanged => controlsVisible != controlsVisiblePrevious;
//   // bool get visibilityNotChanged => !visibilityChanged;
//   // bool get notPlaying => !playing;
//   // bool get controlsNotVisible => !controlsVisible;
//   // bool get mute => volume <= 0;
//   // bool get notMute => volume > 0;

//   VideoState copyWith({
//     BetterPlayerController? controller,
//     bool? loaded,
//   }) {
//     return VideoState._(
//       bcontroller: controller ?? this.bcontroller,
//       loaded: loaded ?? this.loaded,
//     );
//   }

//   Future<void> dispose() async {
//     bcontroller.dispose();
//   }
// }
