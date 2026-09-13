import 'dart:convert';

import 'package:lizziedow/app/app_urls.dart';
import 'package:lizziedow/data/network/base_api_services.dart';
import 'package:lizziedow/data/network/network_api_services.dart';
import 'package:lizziedow/features/auth/model/user_model.dart';

class AuthRepository {
  AuthRepository({BaseApiServices? apiServices})
      : _apiServices = apiServices ?? NetworkApiServices();

  final BaseApiServices _apiServices;

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiServices.postApi(AppUrls.loginUrl, {
      'email': email,
      'password': password,
    });

    final responseJson = jsonDecode(response) as Map<String, dynamic>;
    final error = responseJson['error'] as String?;

    if (error != null && error.isNotEmpty) {
      throw Exception(error);
    }

    return UserModel.fromJson(responseJson);
  }
}
