import 'dart:io';

import 'package:file_converter/data_layer/list_files.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var list = <FileSystemEntity>[];
  @override
  void initState() {
    listStuff();
    super.initState();
  }

  void listStuff() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    list = listFiles();
  }

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const Center(child: Text("No FIles yet"))
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Text("${list[index]}");
            });
  }
}
