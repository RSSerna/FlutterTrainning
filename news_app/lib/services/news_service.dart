import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier {
  final _baseUrl = 'newsapi.org';
  final _apiKey = 'e30bd3a998c044c3840f25b942768701';

  List<Article> articles = [];
  List<Category> categories = [
    Category(
      iconData: FontAwesomeIcons.building,
      name: 'Business',
    ),
    Category(
      iconData: FontAwesomeIcons.masksTheater,
      name: 'Entertainment',
    ),
    Category(
      iconData: FontAwesomeIcons.addressCard,
      name: 'General',
    ),
    Category(
      iconData: FontAwesomeIcons.virusCovid,
      name: 'Health',
    ),
    Category(
      iconData: FontAwesomeIcons.vials,
      name: 'Science',
    ),
    Category(
      iconData: FontAwesomeIcons.tableTennisPaddleBall,
      name: 'Sports',
    ),
    Category(
      iconData: FontAwesomeIcons.memory,
      name: 'Technology',
    ),
  ];

  String _selectedCategory = 'Business';

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory();
    // notifyListeners();
  }

  List<Article> get articlesOfSelectedCategory =>
      categoryArticles[_selectedCategory]!;

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    categories.forEach((element) => categoryArticles[element.name] = []);
    getArticlesByCategory();
    getTopHeadlines();
  }

  getTopHeadlines() async {
    // String url = '$_urlNews/top-headlines?country=us&apiKey=$_apiKey';
    var url = Uri.https(
        _baseUrl, '/v2/top-headlines', {'apiKey': _apiKey, 'country': 'us'});
    final resp = await http.get(url);

    final newsModel = NewsModel.fromJson(resp.body);
    articles.addAll(newsModel.articles);
    notifyListeners();
  }

  getArticlesByCategory() async {
    if (categoryArticles[_selectedCategory]!.isNotEmpty) return;

    var url = Uri.https(_baseUrl, '/v2/top-headlines', {
      'apiKey': _apiKey,
      'country': 'us',
      'category': _selectedCategory.toLowerCase()
    });
    final resp = await http.get(url);

    categoryArticles[_selectedCategory]!
        .addAll(NewsModel.fromJson(resp.body).articles);

    notifyListeners();
    // print(categoryArticles[_selectedCategory]?.first.title);
  }
}
