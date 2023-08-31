import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/constants/style.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/update_product.dart';

import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);
  static String id = 'UpdateProduct';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, image, desc, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    hint: 'Product Name',
                    onChanged: (data) {
                      productName = data;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hint: 'Description',
                    onChanged: (data) {
                      desc = data;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hint: 'Price',
                    onChanged: (data) {
                      price = data;
                    },
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hint: 'Image',
                    onChanged: (data) {
                      image = data;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    text: 'Update',
                    backColor: kPrimaryColor,
                    onPress: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await UpdateProductServices().updateproduct(
                            id: product.id,
                            title: productName == null
                                ? product.title
                                : productName!,
                            price: price == null
                                ? product.price.toString()
                                : price!,
                            desc: desc == null ? product.description : desc!,
                            image: image == null ? product.image : image!,
                            category: product.category);
                      } catch (e) {
                        print(e.toString());
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
