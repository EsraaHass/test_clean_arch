import 'package:bloc/bloc.dart';
import 'package:test_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:test_clean_architecture/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/auth_event.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/auth_state.dart';

import '../../domain/use_cases/sign_in_use_case.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;

  AuthBloc(this.signUpUseCase, this.signInUseCase) : super(AuthInitialState()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthInitialState());

      try {
        await signUp(event.model, event.pass);
        await Future.delayed(const Duration(seconds: 1));
        emit(SignUpState());
      } catch (e) {
        print('error message signUp = ${e.toString()}');
        emit(ErrorSignUpState(e.toString()));
      }
    });
    on<SignInEvent>((event, emit) async {
      emit(AuthInitialState());

      try {
        await signIn(event.email, event.pass);
        await Future.delayed(const Duration(seconds: 1));
        emit(SignInState());
      } catch (e) {
        print('error message signIn= ${e.toString()}');
        emit(ErrorSignUpState(e.toString()));
      }
    });
  }

  Future<String> signUp(UserModel model, String pass) async {
    var res = await signUpUseCase.call(model, pass);
    print(res);
    return res;
  }

  Future<String> signIn(String email, String pass) async {
    var res = await signInUseCase.call(email, pass);
    print(res);
    return res;
  }
}
