import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/domain/entities/video_post.dart';
import 'package:flutter_test_app/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        return Stack(
          children: [
            Positioned(
              child: VideoButtons(video: videoPost),
              bottom: 40,
              right: 20,
            )
          ],
        );
      },
    );
  }
}
