import 'package:bloc/bloc.dart';
import 'package:test_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:test_clean_architecture/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/sign_up_event.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/sign_up_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;

  AuthBloc(this.signUpUseCase) : super(AuthInitialState()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthInitialState());

      try {
        Future<String> signUp(UserModel model, String pass) async {
          var res = await signUpUseCase.call(model, pass);
          print(res);
          return res;
        }
      } catch (e) {
        print('error message = ${e.toString()}');
        emit(ErrorSignUpState(e.toString()));
      }
    });
  }

  Future<String> signUp(UserModel model, String pass) async {
    var res = await signUpUseCase.call(model, pass);
    print(res);
    return res;
  }
}
