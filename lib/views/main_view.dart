import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Column(
        children: [
          const Center(
            heightFactor: 10,
            child: Text('You have entered the main screen.'),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/SignUpView/', (route) => false);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
