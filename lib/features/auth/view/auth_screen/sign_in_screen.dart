import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_clean_architecture/core/constant/dialog.dart';
import 'package:test_clean_architecture/features/auth/di.dart' as di;
import 'package:test_clean_architecture/features/auth/view/auth_screen/sign_up_screen.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/auth_event.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/auth_state.dart';
import 'package:test_clean_architecture/features/showProduct/view/screens/home_page.dart';

import '../bloc/auth_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final email = TextEditingController();
  final pass = TextEditingController();
  late AuthBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = di.sl<AuthBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitialState) {
            showLoadingDialog(context, 'Loading...');
          } else if (state is SignInState) {
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
                    controller: email,
                  ),
                  TextFormField(
                    controller: pass,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        bloc.add(SignInEvent(email.text, pass.text));
                      },
                      child: const Text('Login')),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const SignUp()));
                      },
                      child:
                          const Text('Dont have any account ? Register now.')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
