import 'package:file_converter/business_logic/cubits/download_cubit/download_cubit.dart';
import 'package:file_converter/business_logic/cubits/file_conversion_cubit/file_conversion_cubit.dart';
import 'package:file_converter/business_logic/cubits/file_selection_cubit/file_bloc.dart';
import 'package:file_converter/constants/props.dart';
import 'package:file_converter/data_layer/cloud_convert/cloudconvert_api_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});
  final cloudConvert = CloudConvertMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Download File")),
      body: BlocBuilder<FileConversionCubit, FileConversionState>(
        builder: (context, state) {
          if (state is FileConversionCompleted && state.downloadLink != null) {
            /// single file

            return BlocProvider(
              create: (context) => DownloadCubit(),
              child: Center(
                child: BlocBuilder<DownloadCubit, DownloadState>(
                  builder: (context, downloadState) {
                    if (downloadState is Downloading) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "Downloading",
                            style: TextStyle(color: primaryColor),
                          ),
                          SizedBox(height: 100),
                          CircularProgressIndicator(
                            color: primaryColor,
                          )
                        ],
                      );
                    } else if (downloadState is DownloadComplete) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Download Complete",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 69, 230, 152)),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Icon(
                                Icons.check_circle_outline_sharp,
                                color: primaryColor,
                              )
                            ],
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  enableFeedback: true,
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => primaryColor)),
                              onPressed: () {
                                Navigator.pushNamed(context, "history");
                              },
                              child: const Text(
                                "Finish",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      );
                    } else if (downloadState is DownloadFailed) {
                      return ElevatedButton(
                          style: ButtonStyle(
                              enableFeedback: true,
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => primaryColor)),
                          onPressed: () async {
                            /// Download the converted file via the link
                          },
                          child: const Text(
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ));
                    } else {
                      return ElevatedButton(
                          style: ButtonStyle(
                              enableFeedback: true,
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => primaryColor)),
                          onPressed: () async {
                            /// Download the converted file via the link
                            BlocProvider.of<DownloadCubit>(context)
                                .download(state.downloadLink!, state.fileName!);
                          },
                          child: const Text(
                            "Download",
                            style: TextStyle(color: Colors.white),
                          ));
                    }
                  },
                ),
              ),
            );
          } else if (state is FileConversionCompleted &&
              state.downloadLinks != null) {
            /// Multiple files

            return ListView.builder(
                itemCount: state.downloadLinks!.length,
                itemBuilder: ((context, index) {
                  return ElevatedButton(
                      onPressed: () {}, child: Text("Download $index"));
                }));
          } else if (state is FileConversionFailed) {
            /// conversion failed

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("An error Occured while converting the file:"),
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
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => primaryColor)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Return to Conversion",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else {
            /// processing the conversion;

            print("$state");
            return const Center(
                child: CircularProgressIndicator(
              color: primaryColor,
              semanticsLabel: "Loading",
            ));
          }
        },
      ),
    );
  }
}
