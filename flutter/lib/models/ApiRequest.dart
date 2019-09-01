import 'dart:convert';
import 'dart:io';

Future<HttpClientResponse> apiRequest(String url, Map jsonMap, String key, Object value) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set(key, value);
  request.add(utf8.encode(json.encode(jsonMap)));
  HttpClientResponse response = await request.close();
  // todo - you should check the response.statusCode
//    String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  return response;
}
