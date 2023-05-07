import 'package:test_clean_architecture/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<String> signIn(String email, String pass);

  Future<String> signUp(UserModel model, String pass);
}
