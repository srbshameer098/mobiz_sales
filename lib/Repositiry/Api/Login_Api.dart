import 'dart:convert';
import 'package:http/http.dart';
import '../Model_Class/Login_Model.dart';
import 'api_client.dart';

class LoginApi {
  ApiClient apiClient = ApiClient();

  Future<Loginmodel> getLogin(String email, String password) async {
    String trendingpath = 'https://mobiz-api.yes45.in/api/login';
    var body = {
      "email": email,
      "password": password
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return Loginmodel.fromJson(jsonDecode(response.body));
  }
}
