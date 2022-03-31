import 'package:data_app/HomeScreen.dart';
import 'package:data_app/privacy_policy.dart';
import 'package:data_app/saved_task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/welcome_controller.dart';
import 'api_movie/widgets/toprated.dart';
import 'api_movie/widgets/trending.dart';
import 'api_movie/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ChangeTheme extends GetView<WelcomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFCFFFDC),
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset("assets/images/menu.png"),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          elevation: 0,
          backgroundColor: Color(0xFFCFFFDC),
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Movies",
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff9E00FF),
            ),
          ),
        ),
        drawer: Drawer(
          // backgroundColor: Color(0xFFFCF55F),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Color(0xFFFF00B8), Color(0xFF9E00FF)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFBA00E9),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(controller.user.photoURL!),
                  backgroundColor: Colors.white,
                ),
                accountName: Text(
                  "${controller.user.displayName}",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                accountEmail: Text(
                  controller.user.email!,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                leading: Icon(Icons.home_filled, color: Colors.white),
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Get.to(
                    HomeScr(),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.collections_bookmark_rounded,
                    color: Colors.white),
                title: Text(
                  "Saved Notes",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Get.to(
                    Task(),
                  );
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.movie,
                  color: Colors.white,
                ),
                title: Text(
                  "Movies",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Get.to(ChangeTheme());
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.developer_mode_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Get.to(
                    DevNotes(),
                  );
                },
              ),
              
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  controller.logout();
                },
              )
            ]),
          ),
        ),
        body: Movie(),
    );
  }
}

class Movie extends StatefulWidget {

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {

  final String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';

  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
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
    return ListView(
      children: [
        TV(tv: tv),
        TrendingMovies(
          trending: trendingmovies,
        ),
        TopRatedMovies(
          toprated: topratedmovies,
        ),
      ],
    );
  }
}

