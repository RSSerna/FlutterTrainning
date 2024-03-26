import 'package:backgrounds_custompainter_app/models/slider_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowScreen extends StatelessWidget {
  static const String routeName = 'SlideShow';

  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SliderModel();
      },
      child: Scaffold(
        body: Center(
            child: Column(
          children: const [
            Expanded(child: _SlidesWidget()),
            _DotsWidget(),
          ],
        )),
      ),
    );
  }
}

class _DotsWidget extends StatelessWidget {
  const _DotsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot(
            index: 0,
          ),
          _Dot(
            index: 1,
          ),
          _Dot(
            index: 2,
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (index == pageViewIndex.toInt())
              ? Colors.blueAccent
              : Colors.grey,
          shape: BoxShape.circle),
      duration: const Duration(milliseconds: 500),
    );
  }
}

// SvgPicture.asset('assets/svgs/slide-1.svg'),

class _SlidesWidget extends StatefulWidget {
  const _SlidesWidget({Key? key}) : super(key: key);

  @override
  State<_SlidesWidget> createState() => _SlidesWidgetState();
}

class _SlidesWidgetState extends State<_SlidesWidget> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: const [
        _Slide(
          svg: "assets/svgs/slide-1.svg",
        ),
        _Slide(
          svg: "assets/svgs/slide-2.svg",
        ),
        _Slide(
          svg: "assets/svgs/slide-3.svg",
        ),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(svg));
  }
}
