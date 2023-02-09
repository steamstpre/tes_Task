import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/consts/app_consts.dart';
import 'package:project/models/model.dart';

class API {
  Future<List<Model>?> sentRequset(String letter) async {
    final client = http.Client();

    var uriResponse = await client.get(
      Uri.parse(AppStrings.apiUrl + letter),
    );
    try {
      if (uriResponse.statusCode == 200) {
        Iterable response = json.decode(uriResponse.body);
        return List<Model>.from(
          response.map(
            (model) => Model.fromJson(model),
          ),
        );
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}