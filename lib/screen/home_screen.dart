import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/login_screen.dart';

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
    instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // print('No user');
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        ));
      } else {
        print('No user');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              instance.signOut();
            },
            icon: const Icon(Icons.login_outlined),
          ),
        ],
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
