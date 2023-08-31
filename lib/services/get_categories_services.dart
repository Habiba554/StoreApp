import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> allCategories() async {
    http.Response response =
        await Api().get(url: 'hhttps://fakestoreapi.com/products/categories');
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }
}
