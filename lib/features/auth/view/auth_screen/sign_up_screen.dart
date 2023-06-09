import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_clean_architecture/core/constant/dialog.dart';
import 'package:test_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:test_clean_architecture/features/auth/view/auth_screen/sign_in_screen.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/auth_event.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/auth_state.dart';
import 'package:test_clean_architecture/features/showProduct/view/screens/home_page.dart';

import '../bloc/auth_bloc.dart';

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
  late AuthBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = di.sl<AuthBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitialState) {
            showLoadingDialog(context, 'Loading...');
          } else if (state is SignUpState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const MyHomePage()));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        UserModel model = UserModel(
                          id: 1,
                          name: name.text,
                          email: email.text,
                          phone: phone.text,
                          image: '',
                        );
                        bloc.add(SignUpEvent(model, pass.text));
                      },
                      child: const Text('Register')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const SignIn()));
                      },
                      child: const Text('already have account ? Login')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
