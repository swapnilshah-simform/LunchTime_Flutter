import 'package:flutter/material.dart';

import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';
import '../custom_widgets/custom_textfield.dart';
import '../data/user_sign_up.dart';
import '../retrofit/api_service.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscureTextPassword = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isVisible = true;

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
                  const Text(StringApp.signUpCreateAccount,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 2.0),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(StringApp.signUpToGetStarted,
                      style: TextStyle(color: Colors.black26),
                      textScaleFactor: 1.2),
                  sizeBoxSpace(0.05),
                  CustomTextField(
                    controller: nameController,
                    actionType: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(Icons.person),
                    labelText: StringApp.fullName,
                    validator: (String? name) {
                      if (name != null) {
                        if (name.isEmpty) {
                          return StringApp.nameShouldNotEmpty;
                        } else if (!RegExp(Constant.nameRegex).hasMatch(name)) {
                          return StringApp.enterProperName;
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                  const SizedBox(
                    height: 15,
                  ),
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
                          return StringApp.enterStrongPassword;
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
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedGradientButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var res = await client.signUP(
                          UserSignUp(
                            email: emailController.text.toString(),
                            username: nameController.text.toString(),
                            password: passwordController.text.toString(),
                          ),
                        );

                        if (res.response.statusCode == 201) {
                          Navigator.pushNamed(context, StringApp.homeRoute);
                        } else if (res.response.statusCode == 400) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(StringApp.enterProperEmail),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(StringApp.somethingWentWrong),
                            ),
                          );
                        }
                      } else {
                        const snackBar = SnackBar(
                          content: Text(StringApp.somethingWentWrong),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    label: StringApp.signUp,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomText(
                      firstText: StringApp.alreadyUserText,
                      secondText: StringApp.signIn,
                      onTap: () {
                        Navigator.pop(context, StringApp.loginRoute);
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
