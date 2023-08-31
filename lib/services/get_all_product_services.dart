import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../helpers/api.dart';
import '../models/products_model.dart';

class AllProductServices {
  Future<List<ProductModel>> allProduct() async {
    http.Response response =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<dynamic> data = jsonDecode(response.body);
    List<ProductModel> allProduct = [];
    for (int i = 0; i < data.length; i++) {
      allProduct.add(ProductModel.fromJson(data[i]));
    }
    return allProduct;
  }
}
