import 'package:flutter/material.dart';

class ProfileTopInfo extends StatelessWidget {

  const ProfileTopInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chevron_left_outlined,
                    color: Colors.white,
                    size: 40,
                  )),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                maxRadius: 40,
                backgroundImage: NetworkImage(
                    'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/8/87/Stan_Lee.png/revision/latest?cb=20190303192815&path-prefix=es'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Andres Flores',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  Text('andres.floresa@perficient.com',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w100)),
                  Text('Android Developer',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w100)),
                ],
              ),
              const CircleAvatar(
                  maxRadius: 15,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/github.png')
                  // child: Container(
                  //   child: AssetImage('assets/github.png'),
                  // ),
                  ),
                  
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text('10',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text('Kudos this month',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w200)),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                color: Colors.white,
                width: 0.5, 
                height: 40,
              ),
              // const VerticalDivider(
              //   color: Colors.black,
              //   thickness: 5,
              //   endIndent: 4,
              //   width: 2,
              // ),
              Column(
                children: const [
                  Text('5',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text('Kudos received',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w200)),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text('Send KUDO',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
