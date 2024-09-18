import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app/shared/api_constant.dart';
import 'package:news_app/sources/data/data_source/sources_data_source.dart';

import 'package:http/http.dart' as http;
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/models/sources_response.dart';

class SourcesAPIDataSources extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.sourceEndpoint, {
      'apiKey': APIConstant.apiKey,
      'category': categoryId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('there was an error to get SourceResponse ');
    }
  }
}
