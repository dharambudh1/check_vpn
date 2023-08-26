import "package:check_vpn/src/results/failure_result.dart";
import "package:check_vpn/src/results/success_result.dart";
import "package:check_vpn/src/services/api_service.dart";

class CheckVPN {
  CheckVPN._();
  static final CheckVPN instance = CheckVPN._();

  Future<void> getInfo({
    /// Requesting an API Key.
    required String apiKey,
    /// The below-mentioned function will trigger when we get a pos (+)ve result
    required Function(SuccessResult res) onSuccessResult,
    /// The below-mentioned function will trigger when we get a neg (-)ve result
    required Function(FailureResult err) onFailureResult,
  }) async {
    /// We're performing an API Request. It can return one of two response types
    /// Below-written variable is either SuccessResult/FailureResult runtimeType
    final dynamic model = await ApiService.instance.apiResponse(apiKey: apiKey);

    if (model.runtimeType == SuccessResult) {
      /// Here, the response type is SuccessResult (which means we've got a +ve)
      /// Call the callback function onSuccessResult and return +ve gotten value
      onSuccessResult(model as SuccessResult);
    } else if (model.runtimeType == FailureResult) {
      /// Here, the response type is FailureResult (which means we've got a -ve)
      /// Call the callback function onFailureResult and return -ve gotten value
      onFailureResult(model as FailureResult);
    } else {
      /// This chunk of code will execute if model.runtimeType has no match type
    }
    return Future<void>.value();
  }
}
