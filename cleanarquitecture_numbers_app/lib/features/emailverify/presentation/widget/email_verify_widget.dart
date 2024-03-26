import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poker_planning/features/EmailVerify/presentation/bloc/email_verify/email_verify_bloc.dart';
import 'package:poker_planning/features/OTPCode/presentation/widget/otp_code_widget.dart';
import 'package:poker_planning/shared/widgets/custom_filled_form_button.dart';
import 'package:poker_planning/shared/widgets/custom_text_form_field.dart';

class EmailVerifyWidget extends StatelessWidget {
  const EmailVerifyWidget({Key? key, required this.onSended}) : super(key: key);
  final Function() onSended;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerifyBloc, EmailVerifyState>(
        listener: (context, state) {
      if (state is EmailVerifyAcceptedState) {
        showDialog(
            context: context,
            builder: (BuildContext context) => OPTCodeWidget(
                  email: state.email,
                  operation: 'ForgotPassword',
                  onAccepted: (token) {
                    onSended();
                  },
                ));

        // onSended();
      }
    }, builder: (context, state) {
      return Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _FormValidator(
                  state: state,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class _FormValidator extends StatefulWidget {
  final EmailVerifyState state;
  const _FormValidator({required this.state});
  @override
  State<_FormValidator> createState() => _FormValidatorState();
}

class _FormValidatorState extends State<_FormValidator> {
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgottenPasswordEmailFormKey = GlobalKey<FormState>();

    return Column(
      children: [
        Form(
          key: forgottenPasswordEmailFormKey,
          child: CustomTextFormField(
            prefixIconData: Icons.email,
            hintText: 'Localization: Your Email:',
            textInputType: TextInputType.emailAddress,
            textController: emailCtrl,
            valdiator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                  .hasMatch(value)) {
                print('WOKRING_EMAIL');
                return null;
              } else {
                return 'Not valid email';
              }
            },
          ),
        ),
        if (widget.state.errorStr.isNotEmpty)
          Text(
            widget.state.errorStr,
            style: const TextStyle(color: Colors.red),
          ),
        CustomFilledFormButton(
          buttonText: 'Localization: Get Code',
          onPressed: () {
            print('Email:${emailCtrl.text}');
            if (forgottenPasswordEmailFormKey.currentState!.validate()) {
              BlocProvider.of<EmailVerifyBloc>(context)
                  .add(SendEmailEvent(emailCtrl.text));
            }
          },
        ),
      ],
    );
  }
}
