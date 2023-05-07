import 'package:test_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:test_clean_architecture/features/auth/domain/repositories/repo.dart';

class SignUpUseCase {
  AuthRepo signUpUseCase;

  SignUpUseCase(this.signUpUseCase);

  Future<String> call(UserModel model, String pass) async {
    return await signUpUseCase.signUp(model, pass);
  }
}
