import 'package:flutter/material.dart';
import 'package:news_app/models/news_models.dart';
import 'package:news_app/services/news_service.dart';
import 'package:provider/provider.dart';
import 'package:news_app/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return _NavigationModel();
      },
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _BttmNavigationBar(),
      ),
    );
  }
}

class _BttmNavigationBar extends StatelessWidget {
  const _BttmNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paginaActual = Provider.of<_NavigationModel>(context);
    

    return BottomNavigationBar(
        currentIndex: paginaActual.currentPage,
        onTap: (value) => paginaActual.currentPage = value,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'For you'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Headlines'),
        ]);
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final paginaActual = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: paginaActual.pageController,
      physics: const BouncingScrollPhysics(),
      children: const [
        ForYouScreen(),
        HeadlinesScreen()
      ],
    );
  }
}

class _NavigationModel extends ChangeNotifier {
  int _currentPage = 0;
  PageController _pageController =  PageController();

  int get currentPage => _currentPage;

  set currentPage(int index) {
    _currentPage = index;
    _pageController.animateToPage(index,duration: const Duration(milliseconds: 500), curve: Curves.ease);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}

//e30bd3a998c044c3840f25b942768701
//https://newsapi.org/v2/top-headlines?country=us&apiKey=e30bd3a998c044c3840f25b942768701
