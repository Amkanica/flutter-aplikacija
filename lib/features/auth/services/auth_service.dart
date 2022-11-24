import 'package:amazon_clone/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //Signing up user
  void signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
    } catch (e) {}
  }
}
