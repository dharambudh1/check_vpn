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
    /// It is QueryParameter (1), where we assign $apiKey to the "key" Parameter
    final String apiQueryParam1 = "key=$apiKey";
    /// It is QueryParameter (2), here we're setting up the "Content-Type" Param
    const String apiQueryParam2 = "Content-Type=application/json";

    /// Here, we concatenate the API URL and API Path with the above QueryParams
    final String url = "https://vpnapi.io/api?$apiQueryParam1&$apiQueryParam2";
    /// Here, we're parsing & assigning a value of the URL to the obj of the Uri
    final Uri completedUri = Uri.parse(url);

    /// Creation of SuccessResult obj, assigning the default value to the object
    SuccessResult successResult = SuccessResult();
    /// Creation of FailureResult obj, assigning the default value to the object
    FailureResult failureResult = FailureResult();

    try {
      /// Here, we're creating an HTTP Client obj. We'll use it to call the APIs
      final Client client = Client();
      /// Here, our HTTP Client is Sending the GET Req API with the completedUri
      final Response httpResponse = await client.get(completedUri);
      /// Here, we're decoding the encoded API response. That comes from Request
      final Map<String, dynamic> decodedJson = json.decode(httpResponse.body);

      /// Here, we're checking the code. If it starts with "2", it means it's OK
      /// Here, we're assigning our respective results to their specific objects
      httpResponse.statusCode.toString().startsWith("2")
          ? successResult = SuccessResult.fromJson(decodedJson)
          : failureResult = FailureResult.fromJson(decodedJson);

      /// Here, we're closing the client & clean up the resources linked with it
      client.close();
    } on HttpException catch (exception) {
      /// The below-mentioned line starts to execute if the written line crashes
      log("check_vpn : HttpException catch (exception) : ${exception.message}");
    }

    /// If the success result's value is not the initial's value, the res is +ve
    /// If the failure result's value is not the initial's value, the res is -ve
    return !mapEquals(successResult.toJson(), SuccessResult().toJson())
        ? Future<dynamic>.value(successResult)
        : !mapEquals(failureResult.toJson(), FailureResult().toJson())
            ? Future<dynamic>.value(failureResult)
            : Future<dynamic>.value();
  }
}
