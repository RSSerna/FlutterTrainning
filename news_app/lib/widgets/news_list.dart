import 'package:flutter/material.dart';
import 'package:news_app/models/news_models.dart';
import 'package:news_app/theme/app_theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> articles;

  const NewsList({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return NewsArticle(article: articles[index]);
      },
    );
  }
}

class NewsArticle extends StatelessWidget {
  const NewsArticle({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          _TopHeaderArticle(article: article),
          _ArtitcleTitle(article: article),
          _ArticleImage(article: article),
          Text(article.description ?? ''),
          const _ArticleButtoms(),
          const SizedBox(
            height: 10,
          ),
          const Divider()
        ],
      ),
    );
  }
}

class _ArticleButtoms extends StatelessWidget {
  const _ArticleButtoms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      
      children: [
        RawMaterialButton(
          fillColor: AppTheme.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          child: const Icon(Icons.star),
        ),
        RawMaterialButton(
          fillColor: AppTheme.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          child: const Icon(Icons.three_k),
        ),
      ],
    );
  }
}

class _ArticleImage extends StatelessWidget {
  const _ArticleImage({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    if (article.urlToImage != null) {
      return FadeInImage(
          placeholder: const AssetImage('assets/giphy.gif'),
          image: NetworkImage(article.urlToImage!));
    }
    return const Image(image: AssetImage('assets/no-image.png'));
  }
}

class _ArtitcleTitle extends StatelessWidget {
  const _ArtitcleTitle({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(article.title),
    );
  }
}

class _TopHeaderArticle extends StatelessWidget {
  const _TopHeaderArticle({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      article.source.name,
      style: TextStyle(color: AppTheme.primaryColor),
    ));
  }
}
