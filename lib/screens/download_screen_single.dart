import 'package:file_converter/business_logic/cubits/file_conversion_cubit/file_conversion_cubit.dart';
import 'package:file_converter/constants/props.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Download File")),
      body: BlocBuilder<FileConversionCubit, FileConversionState>(
        builder: (context, state) {
          if (state is FileConversionCompleted && state.downloadLink != null) {
            /// single file

            return Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    enableFeedback: true,
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => primaryColor)),
                onPressed: () async {
                  /// Download the converted file via the link
                },
                child: const Text(
                  "Download",
                  style: TextStyle(color: Colors.white),
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
                      ))
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
