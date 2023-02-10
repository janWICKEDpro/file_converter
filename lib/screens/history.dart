import 'dart:io';

import 'package:file_converter/constants/enums.dart';
import 'package:file_converter/constants/props.dart';
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
    setState(() {
      list = listFiles();
    });
  }

  String getFileNameFromFilSystemEntity(FileSystemEntity file) {
    return file.path.split("/").last;
  }

  FileExtensions? getExtensionFromFileSystemEntity(FileSystemEntity file) {
    String name = getFileNameFromFilSystemEntity(file);
    return extensionMap[name.split('.').last];
  }

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? const Center(child: Text("You have not converted any files yet !"))
        : ListView.builder(
            itemCount: list.length,
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
                                    list[index])] ??
                            'assets/images/noimage.ico')),
                  ),
                ),
                onTap: () {},
                title: Text(getFileNameFromFilSystemEntity(list[index])),
              );
            });
  }
}
