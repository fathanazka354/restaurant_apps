import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:restoran_app/constant/result_state.dart';
import 'package:restoran_app/data/api/api_service.dart';
import 'package:restoran_app/data/response/resto_detail_response.dart';

// class RestoDetailProvider extends ChangeNotifier {
//   final ApiService apiService;
//   RestoDetailProvider({required this.apiService});

//   ResultState<RestoDetailResponse> _state =
//       ResultState(status: Status.loading, message: null, data: null);

//   ResultState<RestoDetailResponse> get state => _state;
//   Future<ResultState> getDetail(String id) async {
//     try {
//       _state = ResultState(status: Status.loading, message: null, data: null);
//       notifyListeners();
//       final RestoDetailResponse restoListResponse =
//           await apiService.getDetailResponse(id);
//       _state = ResultState(
//           status: Status.hasData, message: null, data: restoListResponse);
//       notifyListeners();
//       return _state;
//     } on TimeoutException {
//       _state = ResultState(
//           status: Status.error, message: "Not find a jaringan", data: null);
//       notifyListeners();
//       return _state;
//     } on SocketException {
//       _state = ResultState(
//           status: Status.error, message: "Not find a internet", data: null);
//       notifyListeners();
//       return _state;
//     } catch (e) {
//       _state = ResultState(status: Status.error, message: "$e", data: null);
//       notifyListeners();
//       return _state;
//     }
//   }
// }

class RestoDetailProvider extends ChangeNotifier {
  final ApiService apiService;

  RestoDetailProvider({required this.apiService});

  ResultState<RestoDetailResponse> _state =
      ResultState(status: Status.loading, message: null, data: null);
  ResultState<RestoDetailResponse> get state => _state;

  Future<ResultState> getDetails(String id) async {
    try {
      _state = ResultState(status: Status.loading, message: null, data: null);
      notifyListeners();
      final RestoDetailResponse restoDetailRspn =
          await apiService.getDetailResponse(id);
      _state = ResultState(
          status: Status.hasData, message: null, data: restoDetailRspn);
      notifyListeners();
      return _state;
    } on TimeoutException {
      _state = ResultState(
          status: Status.error, message: 'timeoutExceptionMessage', data: null);
      notifyListeners();
      return _state;
    } on SocketException {
      _state = ResultState(
          status: Status.error, message: 'socketExceptionMessage', data: null);
      notifyListeners();
      return _state;
    } on Error catch (e) {
      _state =
          ResultState(status: Status.error, message: e.toString(), data: null);
      notifyListeners();
      return _state;
    }
  }
}
