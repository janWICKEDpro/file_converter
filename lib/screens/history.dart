import 'dart:io';

import 'package:file_converter/business_logic/bloc/history_bloc.dart';
import 'package:file_converter/constants/enums.dart';
import 'package:file_converter/constants/props.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String getFileNameFromFilSystemEntity(FileSystemEntity file) {
    return file.path.split("/").last;
  }

  FileExtensions? getExtensionFromFileSystemEntity(FileSystemEntity file) {
    String name = getFileNameFromFilSystemEntity(file);
    return extensionMap[name.split('.').last];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        return switch (state.loading) {
          null => throw UnimplementedError(),
          HistoryLoadState.empty =>
            const Center(child: Text("You have not converted any files yet !")),
          HistoryLoadState.success => ListView.builder(
              itemCount: state.convertedFiles?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  enableFeedback: true,
                  enabled: true,
                  tileColor: const Color.fromARGB(255, 243, 235, 235),
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(icons[
                                  getExtensionFromFileSystemEntity(
                                      state.convertedFiles![index])] ??
                              'assets/images/noimage.ico')),
                    ),
                  ),
                  onTap: () {
                    BlocProvider.of<HistoryBloc>(context)
                        .add(OnFileClicked(file: state.convertedFiles![index]));
                  },
                  title: Text(getFileNameFromFilSystemEntity(
                      state.convertedFiles![index])),
                );
              }),
          HistoryLoadState.loading => const Center(
              child: CircularProgressIndicator(),
            ),
          HistoryLoadState.unpermitted => Center(
              child: Column(
                children: [
                  const Text("Turn on permission to view your converted Files"),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<HistoryBloc>(context)
                          .add(OnRequestPermissions());
                    },
                    child: Container(
                        height: 50,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Center(
                          child: Text(
                            "Permit",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ],
              ),
            ),
        };
      },
    );
  }
}
