import 'dart:convert';
import 'package:http/http.dart';
import '../Model_Class/mobiz_Model.dart';
import 'api_client.dart';

class MobizApi {
  ApiClient apiClient = ApiClient();

  Future<Mobiz> getMobiz() async {
    String trendingpath =  'https://mobiz-api.yes45.in/api/get_product?store_id=10';
    var body = {};

    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    return Mobiz.fromJson(jsonResponse);
  }
}
