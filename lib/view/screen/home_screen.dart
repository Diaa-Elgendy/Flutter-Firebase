import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/main.dart';
import 'package:flutter_firebase/view/resources/color_manager.dart';
import 'package:flutter_firebase/view/resources/enum_manager.dart';
import 'package:flutter_firebase/view/resources/string_manager.dart';
import 'package:flutter_firebase/view/resources/style_manager.dart';
import 'package:flutter_firebase/view/resources/value_manager.dart';
import 'package:flutter_firebase/view/screen/auth_screens/login_screen.dart';
import 'package:flutter_firebase/view/widgets/loading.dart';
import 'package:flutter_firebase/view_model/cubit/social_cubit/social_cubit.dart';
import 'package:flutter_firebase/view_model/shared_pref/cache_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FirebaseAuth instance = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        SocialCubit socialCubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News Feed'),
            actions: [
              IconButton(
                onPressed: () {
                  CacheHelper.removeDate('uId');
                },
                icon: const Icon(Icons.login_outlined),
              ),
            ],
          ),
          body: state is GetUserSuccess
              ? ListView(
                  children: [
                    // if (!socialCubit.userModel!.isEmailVerified!)
                    if (!FirebaseAuth.instance.currentUser!.emailVerified)
                      Container(
                        color: Colors.amber.withOpacity(0.6),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.error_outline, size: 30),
                            const SizedBox(width: 15),
                            Text(
                              'Please verify email address',
                              style: getMediumStyle(),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () {
                                  FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value) {
                                    showToast('Check your mail', ToastStates.Success);
                                  }).catchError((error) {});
                                },
                                child: Text(
                                  'SEND',
                                  style: getButtonStyle(color: ColorManager.primary),
                                ))
                          ],
                        ),
                      )
                  ],
                )
              : Loading(),
        );
      },
    );
  }
}
