import 'dart:convert';

import 'package:http/http.dart' as http;

enum HttpRequestType { GET, POST }

class ApiClient {
  static Future<http.Response> makeHttpRequest(String endpoint,
      {Object? body,
      Map<String, String>? headers = const {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
      Encoding? encoding,
      HttpRequestType? type = HttpRequestType.POST}) async {
    String baseUrl = 'https://bank.veegil.com/';
    Uri fullUrl = Uri.parse(baseUrl + endpoint);

    try {
      if (type == HttpRequestType.POST) {
        final response = await http.post(fullUrl,
            headers: headers,
            body: body,
            encoding: Encoding.getByName('utf-8'));
        return response;
      } else {
        final response = await http.get(
          fullUrl,
          headers: headers,
        );
        return response;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
