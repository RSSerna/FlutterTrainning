import 'package:backgrounds_custompainter_app/models/slider_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SlideShowWidget extends StatelessWidget {
  const SlideShowWidget({Key? key, required this.slides}) : super(key: key);

  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SliderModel();
      },
      child: Center(
          child: Column(
        children: [
          Expanded(
              child: _SlidesWidget(
            slides: slides,
          )),
          _DotsWidget(
            numOfWidgets: slides.length,
          ),
        ],
      )),
    );
  }
}

class _DotsWidget extends StatelessWidget {
  final int numOfWidgets;
  const _DotsWidget({Key? key, required this.numOfWidgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(numOfWidgets, (index) => _Dot(index: index)),
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
  const _SlidesWidget({Key? key, required this.slides}) : super(key: key);
  final List<Widget> slides;

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
      // children: const [
      //   _Slide(
      //     svg: "assets/svgs/slide-1.svg",
      //   ),
      //   _Slide(
      //     svg: "assets/svgs/slide-2.svg",
      //   ),
      //   _Slide(
      //     svg: "assets/svgs/slide-3.svg",
      //   ),
      // ],
      children: widget.slides
          .map((e) => _Slide(
                slide: e,
              ))
          .toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  // final String svg;
  final Widget slide;

  const _Slide({
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        // child: SvgPicture.asset(svg)
        child: slide);
  }
}
