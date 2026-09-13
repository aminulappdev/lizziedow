import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lizziedow/data/exception/app_exception.dart';
import 'package:lizziedow/data/network/base_api_services.dart';

class NetworkApiServices implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 20));

      return _returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeOutException('Request Time Out');
    }
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 20));

      return _returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeOutException('Request Time Out');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 400:
        return response.body;
      case 401:
        throw UnauthorizedException(response.body);
      case 500:
      default:
        throw FetchDataException(
          'Error occurred while communicating with server. Status code: ${response.statusCode}',
        );
    }
  }
}
