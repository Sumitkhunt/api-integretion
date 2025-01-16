import 'package:http/http.dart' as http;

class ApiServices {
  static var client = http.Client();

  static Future<dynamic> getUsers() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.https("reqres.in", "/api/users");

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      return {'error': 'Failed to fetch data', 'status': response.statusCode};
    }
  }
}
