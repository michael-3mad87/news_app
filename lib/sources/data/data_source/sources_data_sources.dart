import 'dart:convert';

import 'package:news_app/shared/api_constant.dart';
import 'package:news_app/sources/data/models/sources_response.dart';
import 'package:http/http.dart' as http;

class SourcesDataSources {
     Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.sourceEndpoint, {
      'apiKey': APIConstant.apiKey,
      'category': categoryId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }
}