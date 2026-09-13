import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:lizziedow/app/data/exception/execption.dart';
import 'package:lizziedow/app/data/network/base_api_services.dart';


class NetworkApiServices implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);

      if (response.statusCode == 200) {
        return responseJson;
      }
    } on SocketException {
      throw NoInternetExecption('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeOutExecption('Request Time Out');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);

      if (response.statusCode == 200) {
        return responseJson;
      }
    } on SocketException {
      throw NoInternetExecption('No Internet Connection');
    } on TimeoutException {
      throw RequestTimeOutExecption('Request Time Out');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var responseJson = response.body;
        return responseJson;

      case 401:
        throw UnAuthorizedExecption(response.body.toString());

      case 500:
        throw FetchDataException(
          'Error occured while communication with server with status code ${response.statusCode}',
        );
      default:
        throw FetchDataException(
          'Error occured while communication with server with status code ${response.statusCode}',
        );
    }
  }
}
