import 'dart:convert';
import 'dart:developer' as log_dev;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:arabiamusic_app/core/data/config.dart';
import 'package:arabiamusic_app/core/error/server_failure.dart';
import 'package:arabiamusic_app/core/error/success.dart';

class NetworkUtils {
  Future<Map<String, String>> makeHeaders({
    required bool withAuth,
    String? apiKey,
  }) async {
    final headers = <String, String>{
      'Access-Control-Allow-Origin': '*',
    };
    if (withAuth) {
      final savedToken = await Config().getToken();
      headers['Authorization'] = 'Bearer $savedToken';
    }
    return headers;
  }

  Future<Map<String, String>> makeJsonHeaders({
    required bool withAuth,
    String? apiKey,
  }) async {
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    if (withAuth) {
      final token = await Config().getToken();
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  Future<Map<String, String>> makeHeadersForPatch({
    required bool withAuth,
    String? apiKey,
    String? token,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': '*/*',
      'Connection': 'keep-alive',
    };
    if (withAuth) {
      final savedToken = await Config().getToken();
      headers['Authorization'] = 'Bearer ${token ?? savedToken}';
    }
    return headers;
  }

  Either<ServerFailure, Success> responseHandling(http.Response result) {
    if (kDebugMode) {
      print(result.statusCode);
      log_dev.log(result.body, name: result.request?.url.path ?? 'response');
    }
    if (result.statusCode >= 200 && result.statusCode <= 203) {
      Map<String, dynamic>? data;
      if (jsonDecode(result.body) is List) {
        data = {'data': jsonDecode(result.body)};
      } else {
        data = jsonDecode(result.body) as Map<String, dynamic>?;
      }

      return Right(Success(data: data));
    }
    if (result.statusCode == 204) {
      return Right(Success(data: <String, dynamic>{}));
    }
    if (result.statusCode >= 401 && result.statusCode <= 422) {
      return Left(
        ServerFailure(
          statusCode: result.statusCode,
          errors: {'error': jsonDecode(result.body)['message']},
        ),
      );
    }
    if (result.statusCode == 400) {
      return Left(
        ServerFailure(
          statusCode: result.statusCode,
          errors: {'error': jsonDecode(result.body)['error']},
        ),
      );
    }
    return Left(
      ServerFailure(
        statusCode: 500,
        errors: {'error': 'Server Failure'},
      ),
    );
  }

  Either<ServerFailure, Success> streamedResponseHandling(
    http.StreamedResponse result,
  ) {
    if (kDebugMode) {
      print(result.statusCode);
      log_dev.log(
        result.reasonPhrase!,
        name: result.request?.url.path ?? 'response',
      );
    }
    if (result.statusCode >= 200 && result.statusCode <= 203) {
      Map<String, dynamic>? data;
      data = {'data': 'Success'};
      return Right(Success(data: data));
    }
    if (result.statusCode == 204) {
      return Right(Success(data: <String, dynamic>{}));
    }
    if (result.statusCode >= 401 && result.statusCode <= 422) {
      return Left(
        ServerFailure(
          statusCode: result.statusCode,
          errors: {'error': 'message'},
        ),
      );
    }
    if (result.statusCode == 400) {
      return Left(
        ServerFailure(
          statusCode: result.statusCode,
          errors: {'error': 'error'},
        ),
      );
    }
    return Left(
      ServerFailure(
        statusCode: 500,
        errors: {'error': 'Server Failure'},
      ),
    );
  }

  Future<bool> isConnected() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.mobile ||
        connectivity == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
