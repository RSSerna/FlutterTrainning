import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estados/bloc/user/user_bloc.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              BlocProvider.of<UserBloc>(context,listen: false).add(DeleteUserEvent());
            }, 
            )
        ],
      ),
    
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.userExists
              ? InformacionUsuario(user: state.user!)
              : Center(
                  child: Text('No user'),
                );
        },
      ),

      // InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  const InformacionUsuario({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.edad}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          // ...user.profesiones.map((e) => ListTile(title: Text(e),)).toList()
          _ProfesionLV(user: user),
        ],
      ),
    );
  }
}

class _ProfesionLV extends StatelessWidget {
  const _ProfesionLV({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: user.profesiones.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${user.profesiones[index]}'),
            ); //
          }),
    );
  }
}
