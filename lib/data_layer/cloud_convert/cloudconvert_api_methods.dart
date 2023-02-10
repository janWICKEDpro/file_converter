import 'dart:convert';
import 'dart:developer';

import 'package:file_converter/constants/enums.dart';
import 'package:file_converter/constants/props.dart';
import 'package:file_converter/data_layer/models/cloudconvert_response.dart';
import 'package:http/http.dart' as http;

import '../../business_logic/cubits/file_selection_cubit/file_state.dart';

class CloudConvertMethods {
  final String api = 'https://sync.api.cloudconvert.com/v2/jobs';
  late String finalFileName;

  //import-convert-export single file
  Future<CloudConvertResponse> convertFile(FileState file) async {
    finalFileName = newFileName(file, 0);
    final body = requestBody(file, 0);
    log(body.toString());
    try {
      final response = await http.post(Uri.parse(api),
          body: jsonEncode(body),
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-type': 'application/json'
          });
      log(response.body);

      return CloudConvertResponse.fromJson(
          jsonDecode(response.body), finalFileName);
    } catch (e) {
      print(e);
      return CloudConvertResponse();
    }
  }

  //import-convert-export multiple files
  Future<List<String>> convertFiles(FileState file) async {
    List<String> links = [];
    Map<String, Object> body;
    int index = 0;
    while (index < file.files.length) {
      finalFileName = newFileName(file, index);
      body = requestBody(file, index);
      try {
        final response = await http.post(Uri.parse(api),
            body: jsonEncode(body),
            headers: {
              'Authorization': 'Bearer $apiKey',
              'Content-type': 'application/json'
            });
        index++;

        //add the link of the converted file.
        links.add(downloadLink(CloudConvertResponse.fromJson(
            jsonDecode(response.body), finalFileName)));
        finalFileName = '';
      } catch (e) {
        log(e.toString());
        links = [];
        return links;
      }
    }
    return links;
  }

  //get download link
  String downloadLink(CloudConvertResponse response) {
    return response.data!['tasks'][0]['result']['files'][1]['url'];
  }

  String newFileName(FileState file, int index) {
    List<String> filename = [];
    String result = "";
    filename = file.files[index].file!.name.split('.');
    filename.last = reverseExtensionMap[file.files[index].conversionExtension]!;
    filename.insert(filename.indexOf(filename.last), '[convert].');
    for (var word in filename) {
      result += word;
    }
    return result;
  }

  Map<String, Object> requestBody(FileState file, int index) {
    return {
      'tasks': {
        'import-1': {
          'operation': 'import/base64',
          'file': file.files[index].base64,
          'filename': file.files[index].file!.name
        },
        'task-1': {
          'operation': 'convert',
          'input_format': file.num == NumberOfFiles.multiple
              ? reverseExtensionMap[file.extensions![index]]
              : reverseExtensionMap[file.extension],
          'output_format':
              reverseExtensionMap[file.files[index].conversionExtension],
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
  }
}
