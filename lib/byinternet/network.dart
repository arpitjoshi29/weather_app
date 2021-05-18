import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:weather/screens/home.dart';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    try {
      https.Response response = await https.get(url);
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      return Home();
    }
  }
}
