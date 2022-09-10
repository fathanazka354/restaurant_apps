import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:restoran_app/constant/result_state.dart';
import 'package:restoran_app/data/api/api_service.dart';
import 'package:restoran_app/data/response/resto_list_response.dart';

class RestoListProvider extends ChangeNotifier {
  final ApiService apiService;
  RestoListProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }
  ResultState<RestoListResponse> _state =
      ResultState(status: Status.loading, message: null, data: null);

  ResultState<RestoListResponse> get state => _state;
  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState(status: Status.loading, message: null, data: null);
      notifyListeners();
      final RestoListResponse restoListResponse =
          await apiService.getListResponse();
      _state = ResultState(
          status: Status.hasData, message: null, data: restoListResponse);
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
      _state = ResultState(
          status: Status.error, message: "Not find a internet", data: null);
      notifyListeners();
      return _state;
    }
  }
}
