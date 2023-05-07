import 'package:flutter/material.dart';
import 'package:test_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:test_clean_architecture/features/auth/di.dart' as di;

import '../bloc/sign_up_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = di.sl<AuthBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: name,
              ),
              TextFormField(
                controller: email,
              ),
              TextFormField(
                controller: phone,
              ),
              TextFormField(
                controller: pass,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await cubit.signUp(
                        UserModel(
                          id: 1,
                          name: name.text,
                          email: email.text,
                          phone: phone.text,
                          image: '',
                        ),
                        pass.text);
                  },
                  child: const Text('Go'))
            ],
          ),
        ),
      ),
    );
  }
}
