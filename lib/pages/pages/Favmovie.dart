import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package
import '../../modelclass/provider.dart'; // Import Favmovies

class MovieListWidget extends StatelessWidget {
  List<Color> color = [Colors.black, Colors.black54, Colors.black12];

  @override
  Widget build(BuildContext context) {
    final moviesProvider = context.watch<Favmovies>();
    final movies = moviesProvider.favmovie;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Favorite Movies',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: color,
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
              leading: Image.network(movie.posturl),
            );
          },
        ),
      ),
    );
  }
}
