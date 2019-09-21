import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> apiRequest(
    String type, String url, Map headers, var body) async {
  http.Response uriResponse;
  var client = http.Client();
  if (type == 'post') {
    try {
      uriResponse =
          await client.post(url, headers: headers, body: body, encoding: utf8);
      return uriResponse;
    } catch (error) {
      print(error);
    } finally {
      client.close();
    }
  }
  if (type == 'get') {
    try {
      uriResponse = await client.get(url, headers: headers);
      return uriResponse;
    } catch (error) {
      print(error);
    } finally {
      client.close();
    }
  }
  return uriResponse;
}
