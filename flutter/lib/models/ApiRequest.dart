import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> apiRequest(String type,String url,Map headers, var body) async {
  var client = new http.Client();
  if(type == 'post'){
    try {
      http.Response uriResponse = await client.post(url,
          headers: headers,
          body: body, encoding:utf8);
      return uriResponse;
    } finally {
      client.close();
    }
  }
  if(type == 'get'){
    try {
      http.Response uriResponse = await client.get(url,
          headers: headers);
      return uriResponse;
    } finally {
      client.close();
    }
  }

}