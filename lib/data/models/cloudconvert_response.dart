class CloudConvertResponse {
  CloudConvertResponse(this.data);
  Map<String, dynamic> data;

  factory CloudConvertResponse.fromJson(Map<String, dynamic> response) {
    return CloudConvertResponse(response['data']);
  }
}
