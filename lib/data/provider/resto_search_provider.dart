import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:restoran_app/constant/result_state.dart';
import 'package:restoran_app/data/api/api_service.dart';
import 'package:restoran_app/data/response/resto_search_response.dart';

class RestoSearchProvider extends ChangeNotifier {
  final ApiService apiService;
  RestoSearchProvider({required this.apiService});
  ResultState<RestoSearchResponse> _state = ResultState(
      status: Status.loading,
      message: null,
      data: RestoSearchResponse(error: false, founded: 0, restaurant: []));

  ResultState<RestoSearchResponse> get state => _state;

  Future<dynamic> getDetail(String query) async {
    try {
      _state = ResultState(status: Status.loading, message: null, data: null);

      final RestoSearchResponse restoListResponse =
          await apiService.getSearchResponse(query);
      _state = ResultState(
          status: Status.hasData, message: null, data: restoListResponse);
      notifyListeners();
      return _state;
    } on TimeoutException {
      _state = ResultState(
          status: Status.error, message: "Not find a jaringan", data: null);
      notifyListeners();
      return _state;
    } on SocketException {
      _state = ResultState(
          status: Status.error, message: "Not find a internet", data: null);
      notifyListeners();
      return _state;
    } catch (e) {
      _state = ResultState(status: Status.error, message: "$e", data: null);
      notifyListeners();
      return _state;
    }
  }
}
