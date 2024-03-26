import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:formulario_arq/bloc/api/api_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'API',
                style: TextStyle(fontSize: 45),
              ),
            ),
            const Text("Search for a Date"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(
                      
                      context,
                      showTitleActions: true,
                      minTime: DateTime(2014, 1, 1),
                      maxTime: DateTime(2016, 12, 31),
                      onConfirm: (definedDate) {
                        BlocProvider.of<ApiBloc>(context, listen: false).add(
                            SearchApiResponseEvent(
                                definedDate.toString()));
                         Navigator.pop(context);
                      },
                    );
                  },
                  child: const Text('Date Time Picker')),
            ),
            const Text('Choose a date')
          ],
        ),
      ),
    );
  }
}
