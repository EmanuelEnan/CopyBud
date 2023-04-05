import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/copy_model.dart';

class AdCopyService {
  Constants constants = Constants();
  Future<CopyModel> postApi(
      String prompt, String prompt1, String prompt2) async {
    String url = constants.adCopyCreate;

    Map<String, String> param = {
      "prompt": prompt,
      "prompt1": prompt1,
      "prompt2": prompt2,

      // "size": size,
    };

    Uri uri = Uri.parse(url);
    // final finalUri = uri.replace(queryParameters: qParams);

    final response = await http.post(
      uri,
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: jsonEncode(param),
    );

    if (response.statusCode == 200) {
      final resp = response.body;
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
