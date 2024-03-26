import 'package:flutter/material.dart';

class AuthBackgroundWidget extends StatelessWidget {
  final Widget child;
  const AuthBackgroundWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blueGrey[200],
      child: Stack(
        children: [
          const _PurpleContainer(),
          SafeArea(
              child: Container(
            width: double.infinity,
            child: const Icon(Icons.person_pin,color: Colors.white,size: 100,),
          ),),
          this.child
        ],
      ),
    );
  }
}

class _PurpleContainer extends StatelessWidget {
  const _PurpleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1)
          ],
        ),
      ),
      child: Stack(
        children: const [
          Positioned(
            top: 30,
            right: 30,
            child: _Bubbble(),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: _Bubbble(),
          ),
          Positioned(
            right: -5,
            child: _Bubbble(),
          ),
        ],
      ),
    );
  }
}

class _Bubbble extends StatelessWidget {
  const _Bubbble({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.02),
      ),
    );
  }
}
