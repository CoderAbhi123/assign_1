import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
              child: Text(
                  'Verify your email address by clicking the link in the email')),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.currentUser!.sendEmailVerification();
            },
            child: const Text('Resend email verification mail'),
          ),
          ElevatedButton(
            onPressed: ()async{
              final user= FirebaseAuth.instance.currentUser;
              if(user!=null){

                if(!user.emailVerified){
                  await user.reload();
                }
                if(user.emailVerified){
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/MainView/', (route) => false);
                }
              }
            },
            child: const Text('If verified then click here!'),
          ),
        ],
      ),
    );
  }
}
