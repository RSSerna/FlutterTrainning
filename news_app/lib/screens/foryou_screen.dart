import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ForYouScreen extends StatelessWidget {
  static const String routeName = 'ForYou';

  const ForYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CategoriesList(categories: newsProvider.categories),
            // ignore: unnecessary_null_comparison
            newsProvider.articlesOfSelectedCategory != null
                ? Expanded(
                    child: NewsList(
                    articles: newsProvider
                        .articlesOfSelectedCategory,
                  ))
                // Text('Si hat data')
                : const Center(
                  child: CircularProgressIndicator(),
                )
          ],
        ),
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 110,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _CategoryBtn(category: categories[index]),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(categories[index].name)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryBtn extends StatelessWidget {
  const _CategoryBtn({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final NewsService newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.name;
        print(category.name);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.iconData,
          color: category.name == newsService.selectedCategory
              ? Colors.red
              : Colors.black54,
        ),
      ),
    );
  }
}
