import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late FirebaseAuth instance = FirebaseAuth.instance;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(hintText: 'Name'),
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
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
              ElevatedButton(
                child: const Text('Register'),
                onPressed: () async {
                  try {
                    UserCredential credential = await instance.createUserWithEmailAndPassword(
                        email: emailCtrl.text, password: passwordCtrl.text);
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('weak-password');
                    } else if (e.code == 'email-already-in-use') {
                      print('email-already-in-use');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
