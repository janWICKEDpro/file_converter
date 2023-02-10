import 'dart:io';

import 'package:file_converter/data_layer/list_files.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var list = <FileSystemEntity>[];
  @override
  void initState() {
    list = listFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const Text("No FIles yet")
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Text("${list[index]}");
            });
  }
}
