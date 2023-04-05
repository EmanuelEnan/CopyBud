import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/copy_model.dart';

class GetService {
  Constants constants = Constants();
  Future<CopyModel> getApi() async {
    String url = constants.getCreate;

    Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams);

    final response = await http.get(
      uri,
    );
    print(url);

    if (response.statusCode == 200) {
      print(response.statusCode);
      final resp = response.body;
      // final resp = response.body;
      print(resp);
      Map<String, dynamic> services = jsonDecode(resp);

      // Map<String, dynamic> map = json.decode(resp);
      // List<dynamic> data = map["dataKey"];

      // return Employees.fromJson(jsonDecode(resp));
      // List service = jsonDecode(resp);

      // return service.map((json) => ImageModel.fromJson(json)).toList();

      return CopyModel.fromJson(services);
      //
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}