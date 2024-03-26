import 'package:flutter/material.dart';

class ProfileBottomBox extends StatelessWidget {
  final String title;
  final List<String> textsInfo;
  const ProfileBottomBox({
    Key? key,
    required this.title,
    required this.textsInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            child:
                Column(children: [
              ...textsInfo.map(
                (text) => Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child:  Text(
                    text,
                    style: const TextStyle(fontFamily: 'RobotoMono'),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}

 //     ListView.builder(
    //   itemCount: textsInfo.length,
    //   itemBuilder: (_, index) => Container(
    //     margin: const EdgeInsets.all(2),
    //     padding: const EdgeInsets.all(4),
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(20),
    //         color: Colors.white),
    //     child: Text(
    //       textsInfo.elementAt(index),
    //       style: const TextStyle(fontFamily: 'RobotoMono'),
    //     ),
    //   ),
    // )


          // Column(
          //   children: [
          //     Container(
          //         margin: const EdgeInsets.all(2),
          //         padding: const EdgeInsets.all(4),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: Colors.white),
          //         child: const Text(
          //           'Google advocate Android Developer',
          //           style: TextStyle(fontFamily: 'RobotoMono'),
          //         )),
          //     Container(
          //         margin: const EdgeInsets.all(2),
          //         padding: const EdgeInsets.all(4),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: Colors.white),
          //         child: const Text(
          //           'Kotlin by Jetbrains',
          //           style: TextStyle(fontFamily: 'RobotoMono'),
          //         )),
          //   ],
          // ),