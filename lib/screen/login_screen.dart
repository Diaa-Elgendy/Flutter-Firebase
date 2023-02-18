import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/home_screen.dart';
import 'package:flutter_firebase/screen/signup_screen.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(hintText: 'Email'),
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordCtrl,
                decoration: const InputDecoration(hintText: 'Password'),
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  try {
                    UserCredential credential =
                        await instance.signInWithEmailAndPassword(email: emailCtrl.text, password: passwordCtrl.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('user-not-found');
                    } else if (e.code == 'wrong-password') {
                      print('wrong-password');
                    }
                  }
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Register'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SignupScreen();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
