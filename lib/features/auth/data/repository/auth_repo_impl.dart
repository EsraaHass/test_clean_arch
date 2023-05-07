import 'package:test_clean_architecture/features/auth/data/dataSource/auth_remote_dataSource.dart';
import 'package:test_clean_architecture/features/auth/data/models/user_model.dart';
import 'package:test_clean_architecture/features/auth/domain/repositories/repo.dart';

class AuthRepoImple implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImple(this.authRemoteDataSource);

  @override
  Future<void> signIn(String email, String pass) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<String> signUp(UserModel model, String pass) async {
    return await authRemoteDataSource.signUp(model, pass);
  }
}
