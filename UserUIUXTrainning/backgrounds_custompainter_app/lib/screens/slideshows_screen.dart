import 'package:backgrounds_custompainter_app/widgets/slideshow_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowsScreen extends StatelessWidget {
  static const String routeName = 'SlideShows';

  const SlideShowsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SlideShowWidget(
        slides: [
          SvgPicture.asset("assets/svgs/slide-1.svg"),
          SvgPicture.asset("assets/svgs/slide-2.svg"),
          SvgPicture.asset("assets/svgs/slide-3.svg"),
          SvgPicture.asset("assets/svgs/slide-4.svg"),
          SvgPicture.asset("assets/svgs/slide-5.svg"),
        ],
      )),
    );
  }
}
