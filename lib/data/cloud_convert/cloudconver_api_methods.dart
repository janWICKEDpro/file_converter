import 'dart:convert';

import 'package:file_converter/constants/props.dart';
import 'package:file_converter/data/models/cloudconvert_response.dart';
import 'package:http/http.dart' as http;

import '../../business_logic/cubits/file_selection_bloc/file_state.dart';

class CloudConvertMethods {
  final String api = 'https://sync.api.cloudconvert.com/v2/jobs';
  //import-convert-export file
  Future<CloudConvertResponse?> convertFile(FileState file) async {
    List<String> filename = file.files[0].file!.name.split('.');
    filename.last = reverseExtensionMap[file.files[0].conversionExtension]!;
    filename.insert(file.files[0].file!.name.lastIndexOf("."), '[convert].');
    String finalFileName = '';
    for (var word in filename) {
      finalFileName += word;
    }

    final body = {
      'tasks': {
        'import-1': {
          'operation': 'import/base64',
          'file': file.files[0].base64,
          'filename': file.files[0].file!.name
        },
        'task-1': {
          'operation': 'convert',
          'input_format': reverseExtensionMap[file.extension],
          'output_format':
              reverseExtensionMap[file.files[0].conversionExtension],
          'input': ['import-1'],
          'optimize_print': true,
          'pdf_a': false,
          'include_markup': false,
          'bookmarks': false,
          'filename': finalFileName
        },
        'export-1': {
          'operation': 'export/url',
          'input': ['import-1', 'task-1'],
          'inline': false,
          'archive_multiple_files': false
        }
      },
      'tag': 'jobbuilder'
    };

    try {
      final response = await http.post(Uri.parse(api),
          body: jsonEncode(body),
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-type': 'application/json'
          });
      return CloudConvertResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      return CloudConvertResponse();
    }
  }

  //get download link
  String downloadLink(Map<String, dynamic> response) {
    return response[''];
  }

  //get download links
  Future<List<String>> downloadLinks(Map<String, dynamic> response) async {
    return [];
  }
}
