import 'package:flutter/material.dart';
import 'package:components_app/widgets/widgets.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> inputMaps = {
      'name': 'Ricardo',
      'email': 'rss@google.com',
      'password': '1234',
      'role': 'User'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input texts'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                // const CustomInputField(
                //   textInputType: TextInputType.name,
                //   hintText: 'Hint',
                //   labelText: 'Label',
                //   helperText: 'Helper',
                //   counterText: 'Counter',
                //   prefixIcon: Icons.account_box,
                //   suffixIcon: Icons.account_tree,
                //   icon: Icons.adb,
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                CustomInputField(
                  textInputType: TextInputType.text,
                  hintText: 'Nombre',
                  labelText: 'Nombre',
                  icon: Icons.accessibility_rounded,
                  formProperty: 'name',
                  formValues: inputMaps,
                ),
                const SizedBox(
                  height: 10,
                ),

                CustomInputField(
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email',
                  labelText: 'Email',
                  icon: Icons.email,
                  formProperty: 'email',
                  formValues: inputMaps,
                ),
                const SizedBox(
                  height: 10,
                ),

                CustomInputField(
                  hintText: 'Hint',
                  labelText: 'Password',
                  icon: Icons.password,
                  obscureText: true,
                  formProperty: 'password',
                  formValues: inputMaps,
                ),
                const SizedBox(
                  height: 10,
                ),

                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(value: 'Admin',child: Text('Admin'),),
                    DropdownMenuItem(value: 'SuperUser',child: Text('SuperUser'),),
                    DropdownMenuItem(value: 'Developer',child: Text('Developer'),),
                    DropdownMenuItem(value: 'Jr.Developer',child: Text('Jr.Developer'),),
                  ],
                  onChanged: (value) {
                    inputMaps['role'] = value ?? 'UserNull';
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    if (!myFormKey.currentState!.validate()) {
                      print('No Valido');
                      return;
                    }
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
