import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('images/download.png'),
            ),
            Text(
              'Sign up',
              style: GoogleFonts.aladin(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: WidgetsBinding.instance.window.physicalSize.width,
              height: WidgetsBinding.instance.window.physicalSize.height * 0.02,
              child: Center(
                child: Text(
                  'Please sign up to create an account',
                  style: GoogleFonts.abel(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: WidgetsBinding.instance.window.physicalSize.height * 0.12,
              width: WidgetsBinding.instance.window.physicalSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width:
                        WidgetsBinding.instance.window.physicalSize.width * 0.8,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _email,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Enter you email here'),
                    ),
                  ),
                  Container(
                    width:
                        WidgetsBinding.instance.window.physicalSize.width * 0.8,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.password,
                            color: Colors.white,
                          ),
                          hintText: 'Enter you password here'),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent),
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                     await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email, password: password);
                      await FirebaseAuth.instance.currentUser!
                          .sendEmailVerification();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/VerifyAccount/', (route) => false);
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(style: TextButton.styleFrom(backgroundColor: Colors.tealAccent),
                    onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/LoginView/', (route) => false);
                    },
                    child: const Text('Already have an account? Login',style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
