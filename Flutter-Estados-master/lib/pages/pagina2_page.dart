import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/bloc/user/user_bloc.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context, listen:  false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                final User user =  User(edad: 22, nombre: 'Juan', profesiones: ['Profe','Deportista']);
                userBloc.add(ActivateUserEvent(user));
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAgeEvent(24));

              }
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(NewUserProfesionEvent('profesion'));
              }
            ),

          ],
        )
     ),
   );
  }
}