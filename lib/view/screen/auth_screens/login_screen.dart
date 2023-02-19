import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/main.dart';
import 'package:flutter_firebase/view/resources/enum_manager.dart';
import 'package:flutter_firebase/view/resources/style_manager.dart';
import 'package:flutter_firebase/view/resources/value_manager.dart';
import 'package:flutter_firebase/view/screen/home_screen.dart';
import 'package:flutter_firebase/view/screen/auth_screens/signup_screen.dart';
import 'package:flutter_firebase/view/widgets/custom_button.dart';
import 'package:flutter_firebase/view/widgets/custom_text_form_field.dart';
import 'package:flutter_firebase/view/widgets/loading.dart';
import 'package:flutter_firebase/view_model/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_firebase/view_model/route_manager.dart';
import 'package:flutter_firebase/view_model/shared_pref/cache_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  late FirebaseAuth instance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.saveData('uId', state.uId).then((value) {
            navigateAndFinish(context, const HomeScreen());
          });
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.pagePadding),
              child: Column(
                children: [
                  CustomTextField(
                    controller: emailCtrl,
                    text: 'Email',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: passwordCtrl,
                    text: 'Password',
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    child: state is LoginLoadingState
                        ? Loading()
                        : Text(
                            'Login',
                            style: getButtonStyle(),
                          ),
                    onTap: () async {
                      authCubit.userLogin(email: emailCtrl.text, password: passwordCtrl.text);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    child: Text(
                      'Register',
                      style: getButtonStyle(),
                    ),
                    onTap: () {
                      navigateTo(context: context, widget: const SignupScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
