import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  void _dumpStatusCode(int stc) {
    print('NetworkHelper(): Got status $stc in response.');
  }

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      _dumpStatusCode(response.statusCode);
    }
  }
}
