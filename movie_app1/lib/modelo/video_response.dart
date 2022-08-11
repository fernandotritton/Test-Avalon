import 'package:movie_app1/modelo/video.dart';
import 'package:movie_app1/modelo/video_response.dart';

class VideoResponse {
  final List<Video> videos;
  final String error;

  VideoResponse(this.videos, this.error);

  VideoResponse.fromJson(Map<String, dynamic> json)
      : videos =
            (json["results"] as List).map((i) => Video.fromJason(i)).toList(),
        error = "";

  VideoResponse.witherror(String errorValue)
      : videos = List(),
        error = errorValue;

  static Future<VideoResponse> withError(String s) {}
}
