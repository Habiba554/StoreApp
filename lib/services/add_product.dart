import 'package:store_app/helpers/api.dart';

import '../models/products_model.dart';

class AddProduct {
  Future<ProductModel> addproduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, String> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category
      },
    );
    return ProductModel.fromJson(data);
  }
}
