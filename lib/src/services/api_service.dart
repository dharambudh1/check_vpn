import "dart:convert";
import "dart:developer";
import "dart:io";

import "package:check_vpn/src/results/failure_result.dart";
import "package:check_vpn/src/results/success_result.dart";
import "package:flutter/foundation.dart";
import "package:http/http.dart";

class ApiService {
  ApiService._();
  static final ApiService instance = ApiService._();

  Future<dynamic> apiResponse({required String apiKey}) async {
    final String apiQueryParam1 = "key=$apiKey";
    const String apiQueryParam2 = "Content-Typ=application/json";

    final String url = "https://vpnapi.io/api?$apiQueryParam1&$apiQueryParam2";
    final Uri completedUri = Uri.parse(url);

    SuccessResult successResult = SuccessResult();
    FailureResult failureResult = FailureResult();

    try {
      final Client client = Client();
      final Response httpResponse = await client.get(completedUri);
      final Map<String, dynamic> decodedJson = json.decode(httpResponse.body);

      httpResponse.statusCode.toString().startsWith("2")
          ? successResult = SuccessResult.fromJson(decodedJson)
          : failureResult = FailureResult.fromJson(decodedJson);

      client.close();
    } on HttpException catch (exception) {
      log("HttpException: ${exception.message}");
    }

    return !mapEquals(successResult.toJson(), SuccessResult().toJson())
        ? Future<dynamic>.value(successResult)
        : !mapEquals(failureResult.toJson(), FailureResult().toJson())
            ? Future<dynamic>.value(failureResult)
            : Future<dynamic>.value();
  }
}
