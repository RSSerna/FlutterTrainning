import 'package:flutter/material.dart';

class PageTitleWidget extends StatelessWidget {
  const PageTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 20,right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: const Text(
                'Classify Transaction',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            const Text(
              'Classify this transaction into a particular category',
              style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
