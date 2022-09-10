import 'dart:convert';

import 'package:restoran_app/data/response/resto_detail_response.dart';
import 'package:restoran_app/data/response/resto_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:restoran_app/data/response/resto_search_response.dart';

class ApiService {
  static const _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const _endpointList = 'list';

  Future<RestoListResponse> getListResponse() async {
    final response = await http.get(Uri.parse(_baseUrl + _endpointList));
    try {
      if (response.statusCode == 200) {
        return RestoListResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<RestoDetailResponse> getDetailResponse(String id) async {
    final response = await http
        .get(Uri.parse('${_baseUrl}detail/$id'))
        .timeout(const Duration(seconds: 5));
    try {
      if (response.statusCode == 200) {
        return RestoDetailResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load details data.');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<RestoSearchResponse> getSearchResponse(String query) async {
    final response = await http
        .get(Uri.parse('${_baseUrl}search?q=$query'))
        .timeout(const Duration(seconds: 5));
    try {
      if (response.statusCode == 200) {
        return RestoSearchResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load Search data.');
      }
    } catch (e) {
      rethrow;
    }
  }
}
