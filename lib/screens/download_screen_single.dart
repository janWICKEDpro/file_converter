import 'package:dio/dio.dart';
import 'package:file_converter/business_logic/cubits/file_selection_bloc/file_bloc.dart';
import 'package:file_converter/constants/enums.dart';
import 'package:file_converter/constants/props.dart';
import 'package:file_converter/data/cloud_convert/cloudconver_api_methods.dart';
import 'package:file_converter/data/download.dart';
import 'package:file_converter/screens/download_screen_multple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Download extends StatelessWidget {
  Download({super.key});
  final cloudConvert = CloudConvertMethods();
  final download = DownloadClass();
  @override
  Widget build(BuildContext context) {
    final fileState = BlocProvider.of<FileCubit>(context).state;
    return Scaffold(
        appBar: AppBar(title: Text(fileState.name!)),
        body: fileState.num == NumberOfFiles.single
            ? FutureBuilder(
                future: cloudConvert.convertFile(fileState),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.data["status"] == "finished") {
                      return Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              enableFeedback: true,
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => primaryColor)),
                          onPressed: () async {
                            /// Download the converted file via the link
                            bool permissionReady =
                                await download.checkPermission();
                            if (permissionReady) {
                              await download.prepareSaveDir();
                              print("Downloading");
                              try {
                                await Dio().download(
                                    snapshot.data?.data['tasks'][0]['result']
                                        ['files'][1]['url'],
                                    "${download.localPath}/${cloudConvert.finalFileName}");
                                print("Download Completed.");
                              } catch (e) {
                                print("Download Failed.\n\n$e");
                              }
                            }
                          },
                          child: const Text(
                            "Download",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              "An error Occured while converting the file:"),
                          const Text("This could be caused by:"),
                          const SizedBox(height: 30),
                          const Text(
                            "- An Invalid Conversion",
                            style: TextStyle(color: Colors.red),
                          ),
                          const Text(
                            "- Unstable internet Connection",
                            style: TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                              style: ButtonStyle(
                                  enableFeedback: true,
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => primaryColor)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Return to Conversion",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: primaryColor,
                      semanticsLabel: "Loading",
                    ));
                  }
                }),
              )
            : MultipleDownload(
                file: fileState,
              ));
  }
}
