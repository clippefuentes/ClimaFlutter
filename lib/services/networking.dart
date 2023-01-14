import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    Uri url = Uri.parse(this.url);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return  decodedData;
    } else {
      print(response.statusCode);
    }
  }
}