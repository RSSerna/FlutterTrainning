import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children:  [
            const Image(image: AssetImage('assets/landscape.jpeg')),
            const _NameAndInfo(),
            const _InfoAndName2(),
            const _IconsList(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text('Et mollit elit consequat ea excepteur amet pariatur sit nostrud deserunt. Magna elit laboris qui eiusmod sit occaecat exercitation. Irure laborum nostrud laborum tempor laborum esse id. In cillum aute culpa ea non velit ut ex exercitation sunt. Cillum elit quis sit cupidatat irure laborum ex pariatur. Adipisicing cillum esse exercitation irure eu consectetur officia ipsum sit.Deserunt laborum laboris non aute aliquip non adipisicing non duis. Dolor culpa qui eiusmod cillum nostrud sunt et pariatur quis dolor elit dolore proident. Commodo cupidatat incididunt in ea qui sunt ullamco laboris eiusmod do officia aute ex in. Adipisicing commodo veniam ad esse exercitation cupidatat non.'),
            )
          ],
        ),
      ),
    );
  }
}

class _NameAndInfo extends StatelessWidget {
  const _NameAndInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Data',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'More Data',
                style: TextStyle(color: Colors.black38),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            children: const [
              Icon(
                Icons.star,
                color: Colors.orangeAccent,
              ),
              Text('41'),
            ],
          ),
        )
      ],
    );
  }
}

class _InfoAndName2 extends StatelessWidget {
  const _InfoAndName2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Data',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'More Data',
                style: TextStyle(color: Colors.black38),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: 10,
              color: Colors.blueGrey,
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.orangeAccent,
          ),
          const Text('41')
        ],
      ),
    );
  }
}

class _IconsList extends StatelessWidget {
  const _IconsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _IconElement(
            iconData: Icons.call,
            iconText: 'Call',
          ),
          _IconElement(
            iconData: Icons.north_east,
            iconText: 'Route',
          ),
          _IconElement(
            iconData: Icons.share,
            iconText: 'Share',
          )
        ],
      ),
    );
  }
}

class _IconElement extends StatelessWidget {
  final IconData iconData;
  final String iconText;
  const _IconElement({
    Key? key,
    required this.iconData,
    required this.iconText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, color: Colors.blue),
        Text(
          iconText,
          style: const TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}
