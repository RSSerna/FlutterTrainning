import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_login_app/UI/input_decorations.dart';
import 'package:rest_login_app/providers/login_form_provider.dart';
import 'package:rest_login_app/screens/screens.dart';
import 'package:rest_login_app/services/services.dart';
import 'package:rest_login_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'Register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackgroundWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Register',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Formulario'),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: _LoginForm(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, LoginScreen.routeName),
                child: const Text(
                  'Ya tengo una cuenta',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final authService = Provider.of<AuthService>(context);
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                  'your@email.com',
                  'Email',
                  const Icon(
                    Icons.email,
                    color: Colors.purple,
                  ),
                ),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);
                  return regExp.hasMatch(value ?? '') ? null : 'Not an Email';
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                // keyboardType: TextInputType.,
                decoration: InputDecorations.authInputDecoration(
                  '****',
                  'Password',
                  const Icon(
                    Icons.password,
                    color: Colors.purple,
                  ),
                ),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  if (value != null && value.length > 6) return null;
                  return "Min 6 caracteres";
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledColor: Colors.grey,
                color: Colors.purple,
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        final String? errorMsg = await authService.createUser(
                            loginForm.email, loginForm.password);

                        if (errorMsg == null) {
                          Navigator.pushReplacementNamed(context, 'Home');
                        }
                        else
                        {
                          
                          NotificationService.showSnackBar(errorMsg);
                        }

                        loginForm.isLoading = false;
                        
                      },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  child: Text(
                    loginForm.isLoading ? 'Espere' : 'Ingresar',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
