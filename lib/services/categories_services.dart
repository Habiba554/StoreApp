import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/api.dart';
import '../models/products_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesByProduct(
      {required String categoryName}) async {
    http.Response response = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<dynamic> data = jsonDecode(response.body);
    List<ProductModel> allProduct = [];
    for (int i = 0; i < data.length; i++) {
      allProduct.add(ProductModel.fromJson(data[i]));
    }
    return allProduct;
  }
}
