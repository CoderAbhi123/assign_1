import 'package:assign_1/firebase_options.dart';
import 'package:assign_1/views/login_view.dart';
import 'package:assign_1/views/main_view.dart';
import 'package:assign_1/views/signup_view.dart';
import 'package:assign_1/views/verify_email_address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/VerifyAccount/': (context)=> const VerifyEmailView(),
        '/LoginView/': (context)=> const LoginView(),
        '/SignUpView/' :(context)=> const SignUpView(),
        '/MainView/':(context)=> const MainView(),
      },
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),builder: (context,snapshot) {
      switch(snapshot.connectionState){
        case ConnectionState.done:
          final user= FirebaseAuth.instance.currentUser;
          if(user!=null){
            if(user.emailVerified){
              return const MainView();
            }
            else{
              return const VerifyEmailView();
            }
          }
          else{
            return const SignUpView();
          }
        default:
          return const Text('Loading');
      }
    });
  }
}


