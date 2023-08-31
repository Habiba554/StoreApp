import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<http.Response> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({required String url, required dynamic body}) async {
    //post request fe mo3zm el a7yan byb2a form data
    http.Response response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put({required String url, required dynamic body}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    http.Response response = await http.put(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
