import 'package:api_app/providers/movies_provider.dart';
import 'package:api_app/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:api_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(
                movies: movieProvider.onDisplayMovie,
              ),
              ImageSliderWidget(
                movies: movieProvider.popularMovie,
                title: 'Populares',
                onNextPage:() => movieProvider.getPopularMovies(),
              ),
              ImageSliderWidget(
                movies: movieProvider.popularMovie,
                title: 'Prueba',
                onNextPage:() => movieProvider.getPopularMovies(),
              )
            ],
          ),
        ));
  }
}
