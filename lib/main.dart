
import 'package:flutter/material.dart';
import 'package:movieapp/pages/pages/Favmovie.dart';
import 'package:movieapp/widgets/toprated.dart';
import 'package:movieapp/widgets/trending.dart';
import 'package:movieapp/widgets/tv.dart';
import 'modelclass/data.dart';
import 'modelclass/provider.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Favmovies(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '36f8619199d6da0dc392c79afc81f176';
  final String acesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNmY4NjE5MTk5ZDZkYTBkYzM5MmM3OWFmYzgxZjE3NiIsInN1YiI6IjY0ZTIzYjkzNjVlMGEyMDBhZDA3NjcwMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xcHNRn4Te16vfI6z3lF54Upcy46jYEWeRhjg5c9Z0Xo';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  List <Color>color = [Colors.black87,Colors.black54,Colors.black12];


  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, acesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: textapp(text: ' Movie App ',size: 30),
          actions:[
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListWidget(),));
            }, icon: Icon(Icons.star)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
           ],

          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: color,
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: ListView(
            children: [
              TV(tv: tv),
              TrendingMovies(
                trending: trendingmovies,
              ),
              TopRatedMovies(
                toprated: topratedmovies,
              ),

            ],
          ),
        ));
  }
}
