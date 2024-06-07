import 'dart:convert';
import 'package:http/http.dart';
import '../Model_Class/Product_Model.dart';
import '../Model_Class/mobiz_Model.dart';
import 'api_client.dart';

class ProductApi {
  ApiClient apiClient = ApiClient();

  Future<SalesProductModel> getProduct() async {
    String trendingpath =  'https://mobiz-api.yes45.in/api/get_product_detail?product_id=24';
    var body = {};

    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    return SalesProductModel.fromJson(jsonResponse);
  }
}
