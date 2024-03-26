import 'package:api_app/models/models.dart';
import 'package:api_app/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar Pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_left_sharp),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('data');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const _EmptyWidget();
    }

    final movieProvider = Provider.of<MovieProvider>(context);
    movieProvider.getSuggestionByQuery(query);

    return StreamBuilder(
        stream: movieProvider.suggestionStream,
        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) {
            return const _EmptyWidget();
          }

          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, index) => _ListMovies(
              movie: movies[index],
            ),
          );
        });
  }
}

class _ListMovies extends StatelessWidget {
  final Movie movie;
  const _ListMovies({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroID = 'search-${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroID!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullImagePoster),
          // width: 100,
          // fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () => Navigator.pushNamed(context, 'details', arguments: [movie,'Search']),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Icon(
      Icons.movie_creation_outlined,
      color: Colors.black38,
      size: 100,
    ));
  }
}
