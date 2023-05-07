import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/auth_bloc.dart';

import 'features/auth/di.dart' as di;
import 'features/auth/view/auth_screen/sign_up_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.initAuth();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(create: (context) => di.sl<AuthBloc>()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
