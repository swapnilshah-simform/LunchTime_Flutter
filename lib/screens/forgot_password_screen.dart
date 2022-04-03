import 'package:flutter/material.dart';

import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_textfield.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController forgotEmailController = TextEditingController();
  Widget sizeBoxSpace(double value) => SizedBox(
    height: MediaQuery.of(context).size.height * value,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  sizeBoxSpace(0.1),
                  const Text(StringApp.forgotPassword,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 2.0),
                  const SizedBox(
                    height: 10,
                  ),
                  sizeBoxSpace(0.05),
                  CustomTextField(
                    controller: forgotEmailController,
                    actionType: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email),
                    labelText: StringApp.emailAddress,
                    validator: (String? email) {
                      if (email != null) {
                        if (email.isEmpty) {
                          return StringApp.nameShouldNotEmpty;
                        } else if (!RegExp(Constant.emailRegex)
                            .hasMatch(email)) {
                          return StringApp.enterProperEmail;
                        } else {
                          return null;
                        }
                      }
                      //sunny9662914546@gmail.com
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ElevatedGradientButton(
                    onPressed: null,
                    label: StringApp.resetPassword,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            padding: const EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}
