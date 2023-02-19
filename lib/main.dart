import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/view/resources/enum_manager.dart';
import 'package:flutter_firebase/view/resources/string_manager.dart';
import 'package:flutter_firebase/view/resources/string_manager.dart';
import 'package:flutter_firebase/view/screen/home_screen.dart';
import 'package:flutter_firebase/view/screen/auth_screens/login_screen.dart';
import 'package:flutter_firebase/view_model/bloc_observer.dart';
import 'package:flutter_firebase/view_model/cubit/social_cubit/social_cubit.dart';
import 'package:flutter_firebase/view_model/shared_pref/cache_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'view/resources/color_manager.dart';
import 'view/resources/theme_manager.dart';
import 'view_model/cubit/auth_cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  Widget startWidget;

  if (CacheHelper.getData('uId') != null) {
    StringManager.uId = CacheHelper.getData('uId');
    startWidget = const HomeScreen();
    print('uId: ${StringManager.uId}');
  } else {
    startWidget = const LoginScreen();
  }

  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  Widget startWidget;

  MyApp(this.startWidget, {super.key}); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => SocialCubit()..getUser(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase',
        theme: getApplicationThemeData(
        ),
        home: startWidget,
      ),
    );
  }
}

void showToast(String message, ToastStates states) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: states == ToastStates.Success ? ColorManager.green : ColorManager.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
