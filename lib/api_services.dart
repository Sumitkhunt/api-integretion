import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http;

class ApiServices {
  static var client = http.Client();

  static Future<dynamic> getUsers() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.https("reqres.in", "/api/users");

    try {
      var response = await client.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        // Parse and return the JSON response
        return jsonDecode(response.body);
      } else {
        // Handle non-200 status codes
        return {'error': 'Failed to fetch data', 'status': response.statusCode};
      }
    } catch (e) {
      // Handle exceptions (e.g., network issues)
      return {'error': 'An exception occurred', 'details': e.toString()};
    }
  }
}
