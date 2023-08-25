import "package:check_vpn/src/results/failure_result.dart";
import "package:check_vpn/src/results/success_result.dart";
import "package:check_vpn/src/services/api_service.dart";

class CheckVPN {
  CheckVPN._();
  static final CheckVPN instance = CheckVPN._();

  Future<void> getInfo({
    required String apiKey,
    required Function(SuccessResult res) onSuccessResult,
    required Function(FailureResult err) onFailureResult,
  }) async {
    final dynamic model = await ApiService.instance.apiResponse(apiKey: apiKey);

    if (model.runtimeType == SuccessResult) {
      onSuccessResult(model as SuccessResult);
    } else if (model.runtimeType == FailureResult) {
      onFailureResult(model as FailureResult);
    } else {}

    return Future<void>.value();
  }
}
