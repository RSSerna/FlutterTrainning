import 'package:flutter/material.dart';

import '../widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s1 = {'Google advocate Android Developer', 'Kotlin by InteliJ'};
    final s2 = {'Google advocate Android Developer', 'Kotlin by InteliJ','Hi ibisbdans'};
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const ProfileTopInfo(),
            _ProfileBody(s1: s1, s2: s2)
          ],
        ),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({
    Key? key,
    required this.s1,
    required this.s2,
  }) : super(key: key);

  final Set<String> s1;
  final Set<String> s2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 40,
                //  left: 30,
                //   right: 30
                  ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileBottomBox(
                    title: 'Certification',
                    textsInfo: s1.toList(),
                  ),
                  // Divider(),
                  ProfileBottomBox(
                    title: 'Hobbies and "Good Pleasures"',
                    textsInfo: s2.toList(),
                  ),
                  ProfileBottomBox(
                    title: 'Technical Skills',
                    textsInfo: s1.toList(),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
