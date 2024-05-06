class CloudConvertResponse {
  CloudConvertResponse({this.data, this.finalName});
  Map<String, dynamic>? data;
  String? finalName;

  factory CloudConvertResponse.fromJson(
      Map<String, dynamic> response, String name) {
    return CloudConvertResponse(data: response['data'], finalName: name);
  }
}

class CloudConvertSuccessResponse extends CloudConvertResponse {}

class CloudConvertFailedResponse extends CloudConvertResponse {}
