import 'package:file_converter/business_logic/bloc/file_selection_bloc/file_bloc.dart';
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
        appBar: AppBar(title: const Text("Download")),
        body: FutureBuilder(
          future: cloudConvert.convertFile(fileState),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: 100,
                color: Colors.red,
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
        ));
  }
}
