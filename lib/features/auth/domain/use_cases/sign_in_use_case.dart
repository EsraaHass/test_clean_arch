import 'package:test_clean_architecture/features/auth/domain/repositories/repo.dart';

class SignInUseCase {
  AuthRepo signInUseCase;

  SignInUseCase(this.signInUseCase);

  Future<String> call(String email, String pass) async {
    return await signInUseCase.signIn(email, pass);
  }
}
