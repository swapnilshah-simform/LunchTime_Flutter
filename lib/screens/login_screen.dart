import 'package:flutter/material.dart';
import 'package:lunchtime_frontend/screens/homescreen.dart';

import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';
import '../custom_widgets/custom_textfield.dart';
import '../utils/constants.dart';
import '../utils/sizes_helpers.dart';
import '../utils/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String staticEmail = StringApp.staticEmail;
  String staticPassword = StringApp.staticPassword;
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  get displayheight => displayHeight(context);
  bool isVisible = true;

  Widget sizeBoxSpace(double value) => SizedBox(height: displayheight * value);

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
                  const Text(StringApp.welcomeLoginText,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 2.0),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(StringApp.signInToContinue,
                      style: TextStyle(color: Colors.black26),
                      textScaleFactor: 1.2),
                  sizeBoxSpace(0.05),
                  CustomTextField(
                    actionType: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (String? email) {
                      if (email != null) {
                        if (email.isEmpty) {
                          return StringApp.emailShouldNotEmpty;
                        } else if (!RegExp(Constant.emailRegex)
                            .hasMatch(email)) {
                          return StringApp.enterProperEmail;
                        } else {
                          return null;
                        }
                      }
                    },
                    labelText: StringApp.emailAddress,
                    prefixIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    actionType: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    validator: (String? val) {
                      if (val != null) {
                        if (val.isEmpty) {
                          return StringApp.passwordShouldNotEmpty;
                        } else if (!RegExp(Constant.passwordRegex)
                            .hasMatch(val)) {
                          return StringApp.invalidPassword;
                        } else {
                          return null;
                        }
                      }
                    },
                    obscureTextPassword: isVisible,
                    isSuffixVisible: true,
                    prefixIcon: const Icon(Icons.admin_panel_settings_sharp),
                    labelText: StringApp.password,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      StringApp.forgotPassword,
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  sizeBoxSpace(0.02),
                  ElevatedGradientButton(
                      label: StringApp.loginButton,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (staticEmail == emailController?.text &&
                              staticPassword == passwordController?.text) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          } else {
                            const snackBar = SnackBar(
                              content: Text(
                                StringApp.invalidUserNamePassword,
                                textAlign: TextAlign.center,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      }),
                  sizeBoxSpace(0.015),
                  CustomText(
                      firstText: StringApp.newUserText,
                      secondText: StringApp.signUp,
                      onTap: () {
                        Navigator.pushNamed(context, StringApp.signUpRoute);
                      }),
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