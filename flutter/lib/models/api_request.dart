import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_3s_mobile/utils/app_shared_preferences.dart';
import 'package:project_3s_mobile/utils/print_wrapper.dart';

class ApiRequest {
  Future<http.Response> apiGetRequest(String url) async {
    http.Response _uriResponse;
    var _client = http.Client();

    await AppSharedPreferences.getUserLoggedIdToken().then((idToken) async {
      Map<String, String> _headers = {
        HttpHeaders.authorizationHeader: idToken,
      };
      try {
        _uriResponse = await _client.get(url, headers: _headers);
        printWrapped(idToken);
      } catch (error) {
        print(error);
      } finally {
        _client.close();
      }
    });
    return _uriResponse;
  }

  Future<http.Response> apiPostRequest(String url, dynamic body) async {
    http.Response _uriResponse;
    var _client = http.Client();

    await AppSharedPreferences.getUserLoggedIdToken().then((idToken) async {
      Map<String, String> _headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: idToken,
      };
      try {
        _uriResponse = await _client.post(url,
            headers: _headers, body: body, encoding: utf8);
        printWrapped(idToken);
      } catch (error) {
        print(error);
      } finally {
        _client.close();
      }
    });
    return _uriResponse;
  }

  Future<http.Response> apiPutRequest(String url, dynamic body) async {
    http.Response _uriResponse;
    var _client = http.Client();

    await AppSharedPreferences.getUserLoggedIdToken().then((idToken) async {
      Map<String, String> _headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: idToken,
      };
      try {
        _uriResponse = await _client.put(url,
            headers: _headers, body: body, encoding: utf8);
        printWrapped(idToken);
      } catch (error) {
        print(error);
      } finally {
        _client.close();
      }
    });
    return _uriResponse;
  }
}
