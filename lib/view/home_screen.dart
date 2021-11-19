import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:state_management_example/view/widgets/moview_item_widget.dart';
import 'package:state_management_example/viewmodel/movies_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<MoviesViewModel>(context, listen: false).getMovies();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: const Color(0xFF0f0e2a),
      body: SafeArea(
        child: Stack(
          children: [
            const MovieListWidget(),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF0f0e2a),
                      const Color(0xFF0f0e2a).withOpacity(0.8),
                      const Color(0xFF0f0e2a).withOpacity(0.2),
                    ]),
              ),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  'Now Playing',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var moviesViewmodel = Provider.of<MoviesViewModel>(context, listen: true);
    return moviesViewmodel.movieListState == MovieListState.loaded
        ? ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 32.0 * 3, right: 16, left: 16),
            itemCount: 6,
            itemBuilder: (context, index) {
              return MovieItemWidget(moviesViewmodel.movies[index]);
            })
        : moviesViewmodel.movieListState == MovieListState.loading
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox.shrink();
  }
}
