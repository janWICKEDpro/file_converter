import "package:http/http.dart" as http;

import '../../bloc/file_selection_bloc/file_state.dart';

class CloudConvertMethods {
  //import file
  Future<Map<String, dynamic>> convertFile(FileState file) async {
    final response = await http.post(Uri.parse(""),
        body: <String, dynamic>{}, headers: {"Authorization": "Bearer "});
    return {};
  }
}
