import '../helpers/api.dart';
import '../models/products_model.dart';

class UpdateProductServices {
  Future<ProductModel> updateproduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required int id,
      required String category}) async {
    Map<String, String> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
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
