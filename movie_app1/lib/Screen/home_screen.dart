import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_app1/Estilo/theme.dart' as Style;
import 'package:movie_app1/widget/genres.dart';
import 'package:movie_app1/widget/now_playing.dart';
import 'package:movie_app1/widget/persons.dart';
import 'package:movie_app1/widget/top_movies.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline, color: Colors.white),
        title: Text("Películas App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                EvaIcons.searchOutline,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          GenreScreen(),
          PersonList(),
          TopMovies()
        ],
      ),
    );
  }
}
