import 'dart:ui';

import 'package:flutter/material.dart';

class SliderListScreen extends StatelessWidget {
  static const String routeName = 'SliderList';

  const SliderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _SliderTitle(),
      body: Stack(
        children: [
          _MenuScroll(),
          const Positioned(bottom: -10, right: 0, child: _SliverListButtom())
        ],
      ),
    );
  }
}

class _SliverListButtom extends StatelessWidget {
  const _SliverListButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
        child: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
      ))),
      onPressed: () {},
      child: Container(
        width: size.width * 0.85,
        height: 100,
        child: const Center(
          child: Text(
            'CREATE NEW LIST',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 3),
          ),
        ),
      ),
    ));
  }
}

class _MenuScroll extends StatelessWidget {
  _MenuScroll({Key? key}) : super(key: key);

  final items = const [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                210,
                230,
                SafeArea(
                    child: Container(
                        color: Colors.white, child: const _SliderTitle())))),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          const SizedBox(
            height: 100,
          )
        ]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(this.minHeight, this.maxHeight, this.child);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _SliderTitle extends StatelessWidget {
  const _SliderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'New',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.redAccent,
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: const Text(
              'List',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 100,
            height: 8,
            color: Colors.red,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          )
        ],
      ),
    );
  }
}

class _SliderList extends StatelessWidget {
  _SliderList({
    Key? key,
  }) : super(key: key);

  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem(
    this.titulo,
    this.color,
  );

  final String titulo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Text(
        titulo,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
