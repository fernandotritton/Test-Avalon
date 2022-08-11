import 'package:flutter/material.dart';
import 'package:movie_app1/bloc/theme_controller.dart';
import 'package:movie_app1/bloc/theme_service.dart';
import 'app.dart';
import 'repositorio/repositorio.dart';

void main() async {
  final movieRepository = MovieRepository();
  final themeController = ThemeController(ThemeService());
  await themeController.loadSettings();
  runApp(App(
    themeController: themeController,
    movieRepository: movieRepository,
  ));
}
