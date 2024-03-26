import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBarWidget extends StatelessWidget {
   
  const CustomAppBarWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            FaIcon(FontAwesomeIcons.chevronLeft),
            Spacer(),
            FaIcon(FontAwesomeIcons.comment),
            SizedBox(width: 15,),
            FaIcon(FontAwesomeIcons.headphones),
            SizedBox(width: 15,),
            FaIcon(FontAwesomeIcons.arrowUpRightFromSquare),
          ],
        ),
      )
    );
  }
}