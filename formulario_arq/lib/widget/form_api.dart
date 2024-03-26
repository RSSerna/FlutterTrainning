import 'package:flutter/material.dart';

import 'custom_input_field.dart';

class FormApiWidget extends StatelessWidget {
  final Map<String, dynamic> inputMaps;

  const FormApiWidget({Key? key, required this.inputMaps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputField(
          // textInputType: TextInputType.emailAddress,
          hintText: 'String',
          labelText: 'DailySummary',
          // icon: Icons.email,
          formProperty: 'DailySummary',
          formValues: inputMaps,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInputField(
          // textInputType: TextInputType.number,
          hintText: 'Double',
          labelText: 'Temperature',
          // icon: Icons.password,
          formProperty: 'Temperature',
          formValues: inputMaps,
          isNumber: true,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInputField(
          // textInputType: TextInputType.text,
          hintText: 'Double',
          labelText: 'Pressure',
          // icon: Icons.accessibility_rounded,
          formProperty: 'Pressure',
          formValues: inputMaps,
          isNumber: true,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInputField(
          // textInputType: TextInputType.emailAddress,
          hintText: 'Double',
          labelText: 'WindBearing',
          // icon: Icons.email,
          formProperty: 'WindBearing',
          formValues: inputMaps,
          isNumber: true,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInputField(
          hintText: 'Double',
          labelText: 'Visibility',
          // icon: Icons.password,
          formProperty: 'Visibility',
          formValues: inputMaps,
          isNumber: true,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInputField(
          // textInputType: TextInputType.text,
          hintText: 'String',
          labelText: 'PrecipitationType',
          // icon: Icons.accessibility_rounded,
          formProperty: 'PrecipitationType',
          formValues: inputMaps,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInputField(
          // textInputType: TextInputType.emailAddress,
          hintText: 'Double',
          labelText: 'Humidity',
          // icon: Icons.email,
          formProperty: 'Humidity',
          formValues: inputMaps,
          isNumber: true,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInputField(
          hintText: 'Double',
          labelText: 'WindSpeed',
          // icon: Icons.password,
          formProperty: 'WindSpeed',
          formValues: inputMaps,
          isNumber: true,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInputField(
          // textInputType: TextInputType.text,
          hintText: 'Double',
          labelText: 'LoudCover',
          // icon: Icons.accessibility_rounded,
          formProperty: 'LoudCover',
          formValues: inputMaps,
          isNumber: true,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInputField(
          // textInputType: TextInputType.emailAddress,
          hintText: 'String',
          labelText: 'Summary',
          // icon: Icons.email,
          formProperty: 'Summary',
          formValues: inputMaps,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomInputField(
          hintText: 'Double',
          labelText: 'ApparentTemperatur',
          // icon: Icons.password,
          formProperty: 'ApparentTemperatur',
          formValues: inputMaps,
          isNumber: true,
          icon: Icons.hub,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
