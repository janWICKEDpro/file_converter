import "package:http/http.dart" as http;

import '../../business_logic/bloc/file_selection_bloc/file_state.dart';

class CloudConvertMethods {
  //import-convert-export file
  Future<Map<String, dynamic>> convertFile(FileState file) async {
    final Map<String, dynamic> body = {};
    try {
      final response = await http.post(Uri.parse(""),
          body: body, headers: {"Authorization": "Bearer "});
      return {};
    } catch (e) {
      print(e);
      return {};
    }
  }

  //get download link
  Future<String> downloadLink(Map<String, dynamic> response) async {
    return "";
  }

  //get download links
  Future<List<String>> downloadLinks(Map<String, dynamic> response) async {
    return [];
  }
}
