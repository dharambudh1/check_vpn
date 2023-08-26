class FailureResult {
  FailureResult({this.message});

  // Here, we're assigning values from the map to their specific local variable.
  FailureResult.fromJson(Map<String, dynamic> json) {
    message = json["message"];
  }
  String? message;

  // Here, we're building a map of JSON. It is an inverse process of fromJson().
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    return data;
  }
}
