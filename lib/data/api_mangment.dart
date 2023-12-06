import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/ArticalResponses.dart';
import '../model/StatusResponses.dart';

abstract class ApiMangement {
  static const String baseUrl = "https://newsapi.org";
  static const String endPoint = "/v2/top-headlines/sources";
  static const String apiKey = "ba74570daf4846dfb6298e5f19b376fb";

  static Future<SourcesResponses> getSources(String category) async {
    http.Response response = await http.get(Uri.parse('$baseUrl$endPoint?apiKey=$apiKey&category=$category'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return SourcesResponses.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load sources');
    }
  }

  static Future<ArticalResponses> getArticales(String sourceId) async {
    http.Response response = await http.get(Uri.https('newsapi.org', '/v2/everything', {
      "apiKey": apiKey,
      "sources": sourceId,
    }));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return ArticalResponses.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load articles');
    }
  }


  static Future<ArticalResponses> searchArticales(String query) async {
    http.Response response = await http.get(Uri.https('newsapi.org', '/v2/everything', {
      "apiKey": apiKey,
      "q": query,
    }));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return ArticalResponses.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Please search to show');
    }
  }

  static Future<SourcesResponses> langSources(String language) async {
    http.Response response = await http.get(Uri.parse('$baseUrl$endPoint?apiKey=$apiKey&language=$language'));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return SourcesResponses.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load sources');
    }
  }
}