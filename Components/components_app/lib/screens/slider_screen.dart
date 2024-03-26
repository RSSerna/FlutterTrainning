import 'package:components_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 200;
  bool _checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slider n Checks'),
        ),
        body: Column(
          children: [
            Slider.adaptive(
              value: _sliderValue,
              min: 100,
              max: 350,
              activeColor: AppTheme.primaryColor,
              onChanged: _checkValue
                  ? (value) {
                      _sliderValue = value;
                      setState(() {});
                    }
                  : null,
            ),
            // Checkbox(
            //   value: _checkValue,
            //   onChanged: (value) {
            //     _checkValue = value ?? true;
            //     setState(() {});
            //   },
            // ),
            // Switch(
            //   activeColor: AppTheme.primaryColor,
            //   value: _checkValue,
            //   onChanged: (value) => setState(() {_checkValue = value;}),
            // ),
            CheckboxListTile(
              title: const Text('Habilitar Constante'),
              activeColor: AppTheme.primaryColor,
              value: _checkValue,
              onChanged: (value) {
                _checkValue = value ?? true;
                setState(() {});
              },
            ),
            SwitchListTile.adaptive(
              title: const Text('Habilitar Slider'),
              activeColor: AppTheme.primaryColor,
              value: _checkValue,
              onChanged: (value) => setState(() {
                _checkValue = value;
              }),
            ),
            const AboutListTile(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: const NetworkImage(
                          'https://i.pinimg.com/originals/db/c8/cd/dbc8cdd8ca26daf4e5861168a79c473f.png'),
                      fit: BoxFit.contain,
                      width: _sliderValue,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
