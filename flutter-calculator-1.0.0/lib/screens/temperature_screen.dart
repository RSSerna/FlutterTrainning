import 'package:calculadora/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TemperatureScreen extends StatelessWidget {
  const TemperatureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, dynamic> inputMaps = {
      'FormattedDate': 'FormattedDate',
      'DailySummary': 'DailySummary',
      'Temperature': 0.0,
      'Pressure': 0.0,
      'WindBearing': 0.0,
      'Visibility': 0.0,
      'PrecipitationType': 'PrecipitationType',
      'Humidity': 0.0,
      'WindSpeed': 0.0,
      'LoudCover': 0.0,
      'Summary': 'Summary',
      'ApparentTemperatur': 0.0,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          DatePicker.showDateTimePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(2017, 1, 1),
                            maxTime: DateTime(2018, 12, 31),
                            onConfirm: (definedDate) {
                              // BlocProvider.of<ApiBloc>(context, listen: false)
                              //     .add(GetInformation(date: definedDate));
                              print('confirm $definedDate');
                              inputMaps['FormattedDate'] = definedDate;
                            },
                          );
                        },
                        child: const Text('Date Time Picker'),
                      ),
                    ),
                    Text('${inputMaps['FormattedDate']}')
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
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
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!myFormKey.currentState!.validate()) {
                      print('No Valido');
                      return;
                    }
                    //TODO: Send Info
                    print(inputMaps);
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
