import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_3s_mobile/utils/app_shared_preferences.dart';

class ApiRequest {
  Future<http.Response> apiPostRequest(String url, var body) async {
    http.Response uriResponse;
    var client = http.Client();

    await AppSharedPreferences.getUserLoggedIdToken().then((idToken) async {
      Map<String, String> _headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: idToken,
      };
      try {
        uriResponse = await client.post(url,
            headers: _headers, body: body, encoding: utf8);
        printWrapped(idToken);
      } catch (error) {
        print(error);
      } finally {
        client.close();
      }
    });
    return uriResponse;
  }

  Future<http.Response> apiGetRequest(String url, var body) async {
    http.Response uriResponse;
    var client = http.Client();

    await AppSharedPreferences.getUserLoggedIdToken().then((idToken) async {
      Map<String, String> _headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: idToken,
      };
      try {
        uriResponse = await client.post(url,
            headers: _headers, body: body, encoding: utf8);
        printWrapped(idToken);
      } catch (error) {
        print(error);
      } finally {
        client.close();
      }
    });
    return uriResponse;
  }

  // to print idToken in console
  printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
