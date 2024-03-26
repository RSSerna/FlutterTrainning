import 'package:flutter/material.dart';
import 'package:components_app/theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        const ListTile(
          leading: Icon(
            Icons.photo_album_rounded,
            color: AppTheme.primaryColor,
          ),
          title: Text('Soy un titulo'),
          subtitle: Text(
              'Nostrud consequat nulla eiusmod pariatur cupidatat eu incididunt velit fugiat consequat laboris qui. Veniam tempor id sunt dolore culpa non sunt enim ullamco ipsum. Id ea dolore sit id consectetur officia sit eiusmod fugiat excepteur id dolore est mollit.'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('Ok')),
              TextButton(onPressed: () {}, child: const Text('Cancel')),
            ],
          ),
        )
      ]),
    );
  }
}
