import 'package:flutter/material.dart';
import 'package:movie_app1/modelo/video_response.dart';
import 'package:movie_app1/repositorio/repositorio.dart';
import 'package:rxdart/subjects.dart';

class MovieVideosBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<VideoResponse> _subject =
      BehaviorSubject<VideoResponse>();

  getMovieVideos(int id) async {
    VideoResponse response = await _repository.getMovieVideos(id);
    _subject.sink.add(response);
  }

  void drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<VideoResponse> get subject => _subject;
}

final movieVideosBloc = MovieVideosBloc();
