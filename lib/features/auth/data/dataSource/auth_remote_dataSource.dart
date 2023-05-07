import 'package:http/http.dart' as http;
import 'package:test_clean_architecture/core/helpers/api_helpers.dart';
import 'package:test_clean_architecture/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> signIn(String email, String pass);

  Future<String> signUp(UserModel model, String pass);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<String> signIn(String email, String pass) async {
    var url = Uri.parse(ApiHelpers.Base_Url + EndPoints.login);
    final res = await http.post(url, body: {"email": email, "password": pass});
    print(res.body);
    return res.body;
  }

  @override
  Future<String> signUp(UserModel model, String pass) async {
    var url = Uri.parse(ApiHelpers.Base_Url + EndPoints.register);
    final res = await http.post(url, body: {
      "name": model.name,
      "phone": model.phone,
      "email": model.email,
      "password": pass,
      "image": ''
    });
    print(res.body);
    return res.body;
  }
}
