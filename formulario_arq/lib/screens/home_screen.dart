import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario_arq/bloc/api/api_bloc.dart';
import 'package:formulario_arq/model/api_response.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  TextButton(
                    child: const Text('Create'),
                    onPressed: () {
                      // DateTime dateTime = DateTime.now();
                      // dateTime = dateTime.subtract(Duration(milliseconds: dateTime.millisecond));
                      // dateTime = dateTime.subtract(Duration(microseconds: dateTime.microsecond));
                      // dateTime = dateTime.subtract(Duration(seconds: dateTime.second));
                      // print(dateTime.subtract( Duration(seconds: dateTime.second)));
                      Navigator.pushNamed(context, 'crear');
                    },
                  ),
                  TextButton(
                    child: const Text('Search'),
                    onPressed: () => Navigator.pushNamed(context, 'buscar'),
                  ),
                  const Divider(),
                  state.apiResponse.formattedDate != 'No'
                      ? InformacionUsuario(apiResponse: state.apiResponse)
                      : const Center(
                          child: Text('No Api Response'),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final ApiResponse apiResponse;

  const InformacionUsuario({Key? key, required this.apiResponse})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: TextButton(
              child: const Text('Modify'),
              onPressed: () => Navigator.pushNamed(context, 'modificar'),
            ),
          ),
          // const Text('General',
          //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          // const Divider(),
          ListTile(
            title: Text('Value: ${apiResponse.formattedDate}'),
            subtitle: const Text('formattedDate'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.dailySummary}'),
            subtitle: const Text('dailySummary'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.temperature}'),
            subtitle: const Text('temperature'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.pressure}'),
            subtitle: const Text('pressure'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.windBearing}'),
            subtitle: const Text('windBearing'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.visibility}'),
            subtitle: const Text('visibility'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.precipitationType}'),
            subtitle: const Text('precipitationType'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.humidity}'),
            subtitle: const Text('humidity'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.windSpeed}'),
            subtitle: const Text('windSpeed'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.loudCover}'),
            subtitle: const Text('loudCover'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.summary}'),
            subtitle: const Text('summary'),
          ),
          ListTile(
            title: Text('Value: ${apiResponse.apparentTemperatur}'),
            subtitle: const Text('apparentTemperatur'),
          ),

          // ...apiResponse.profesiones.map((e) => ListTile(title: Text(e),)).toList()
        ],
      ),
    );
  }
}
