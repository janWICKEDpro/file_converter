import 'dart:convert';

import 'package:file_converter/business_logic/cubits/file_selection_bloc/file_bloc.dart';
import 'package:file_converter/constants/props.dart';
import 'package:file_converter/data/cloud_convert/cloudconver_api_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Download extends StatelessWidget {
  Download({super.key});
  final cloudConvert = CloudConvertMethods();

  @override
  Widget build(BuildContext context) {
    final fileState = BlocProvider.of<FileCubit>(context).state;
    return Scaffold(
        appBar: AppBar(title: Text(fileState.name!)),
        body: FutureBuilder(
          future: cloudConvert.convertFile(fileState),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.data!["status"] == "finished") {
                return Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        enableFeedback: true,
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => primaryColor)),
                    onPressed: () {
                      /// Download the converted file via the link
                    },
                    child: const Text(
                      "Download",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
              return Container(
                height: 100,
                color: Colors.red,
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
                semanticsLabel: "Loading",
              ));
            }
          }),
        ));
  }
}
