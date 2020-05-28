import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decode = jsonDecode(data);

      return decode;
    } else {
      print(response.statusCode);
    }
  }
}
