import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HeadlinesScreen extends StatefulWidget {
  static const String routeName = 'Headlines';

  const HeadlinesScreen({Key? key}) : super(key: key);

  @override
  State<HeadlinesScreen> createState() => _HeadlinesScreenState();
}

class _HeadlinesScreenState extends State<HeadlinesScreen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: newsService.articles.isEmpty
          ? const Center(child:  CircularProgressIndicator())
          : NewsList(
              articles: newsService.articles,
            ),
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
