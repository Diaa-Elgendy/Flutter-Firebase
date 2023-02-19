import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/main.dart';
import 'package:flutter_firebase/view/resources/enum_manager.dart';
import 'package:flutter_firebase/view/resources/font_manager.dart';
import 'package:flutter_firebase/view/resources/style_manager.dart';
import 'package:flutter_firebase/view/resources/value_manager.dart';
import 'package:flutter_firebase/view/screen/home_screen.dart';
import 'package:flutter_firebase/view/widgets/custom_button.dart';
import 'package:flutter_firebase/view/widgets/custom_text_form_field.dart';
import 'package:flutter_firebase/view/widgets/loading.dart';
import 'package:flutter_firebase/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_firebase/view_model/route_manager.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            navigateAndFinish(context, const HomeScreen());
          }
        },
        builder: (context, state) {
          AuthCubit cubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Register'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.pagePadding),
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameCtrl,
                    text: 'Name',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: emailCtrl,
                    text: 'Email',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: phoneCtrl,
                    text: 'Phone',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: passwordCtrl,
                    text: 'Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    child: state is RegisterLoadingState
                        ? Loading()
                        : Text(
                            'Register',
                            style: getButtonStyle(),
                          ),
                    onTap: () async {
                      try {
                        cubit.userRegister(
                            email: emailCtrl.text,
                            name: nameCtrl.text,
                            phone: phoneCtrl.text,
                            password: passwordCtrl.text);
                      } on FirebaseAuthException catch (e) {
                        showToast(e.code, ToastStates.Error);
                      }
                    },
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
