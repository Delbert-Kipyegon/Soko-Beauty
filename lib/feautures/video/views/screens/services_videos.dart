import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/dummy/videos.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/widgets/player.dart';

class ServicesVideosTab extends StatefulWidget {
  @override
  _ServicesVideosTabState createState() => _ServicesVideosTabState();
}

class _ServicesVideosTabState extends State<ServicesVideosTab> {
  List<Video> allVideos = fetchDummyData(); // Change the type to List<Video>

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: allVideos.map((video) {
        return VideoPlayerScreen(
            videoInfo: video); // Pass the entire Video object
      }).toList(),
    );
  }
}
