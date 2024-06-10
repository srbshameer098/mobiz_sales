import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Model_Class/Login_Model.dart';
import '../Model_Class/mobiz_Model.dart';
import 'api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobizApi {
  ApiClient apiClient = ApiClient();
// late ;
  Future<Mobiz> getMobiz() async {
    // final preferences=await SharedPreferences.getInstance();
    // final storeid=preferences.getString('storeid');

    String trendingpath =  'https://mobiz-api.yes45.in/api/get_product?store_id=10';
    var body = {};

    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    return Mobiz.fromJson(jsonResponse);
  }
}
