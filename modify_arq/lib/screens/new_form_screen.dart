import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:formulario_arq/bloc/api/api_bloc.dart';
import 'package:formulario_arq/model/api_response.dart';

import 'package:formulario_arq/widget/form_api.dart';

class NewFormScreen extends StatelessWidget {
  const NewFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, dynamic> inputMaps =
        BlocProvider.of<ApiBloc>(context, listen: true)
            .state
            .apiResponse
            .toMap();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Creator'),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: myFormKey,
              child: Column(
                children: [
                  FormApiWidget(inputMaps: inputMaps),
                  ElevatedButton(
                    onPressed: () {
                      if (!myFormKey.currentState!.validate()) {
                        print('No Valido');
                        return;
                      }
                      BlocProvider.of<ApiBloc>(context, listen: false).add(
                          NewApiResponseEvent(ApiResponse.fromAnyMap(inputMaps)));
                      Navigator.pop(context);
                      
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Create')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
