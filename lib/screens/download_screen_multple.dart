import 'package:file_converter/business_logic/cubits/file_selection_bloc/file_state.dart';
import 'package:file_converter/constants/props.dart';
import 'package:file_converter/data/cloud_convert/cloudconver_api_methods.dart';
import 'package:file_converter/data/download.dart';
import 'package:flutter/material.dart';

class MultipleDownload extends StatelessWidget {
  MultipleDownload({super.key, this.file});
  FileState? file;
  final cloudConvert = CloudConvertMethods();
  final download = DownloadClass();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cloudConvert.convertFiles(file!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.length == file!.files.length) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return ElevatedButton(
                      onPressed: () {},
                      child: Text("Download ${file!.names![index]}"));
                }));
          }
          return const Center(
            child: Text(
              "Failed to convert one or more files",
              style: TextStyle(color: Colors.red),
            ),
          );
        } else {
          return Center(
              child: Column(
            children: const [
              Text("Multiple Files, This may take a while"),
              CircularProgressIndicator(
                color: primaryColor,
                semanticsLabel: "Loading",
              ),
            ],
          ));
        }
      },
    );
  }
}
