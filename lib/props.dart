import 'package:file_converter/enums.dart';
import 'package:flutter/material.dart';

const primaryColor = Colors.deepOrangeAccent;

// List<String> extensions = ["none", ".docx", ".pdf", ".jpg"];

Map<FileExtensions, String> icons = {
  FileExtensions.docx: "assets/images/docx.jpg",
  FileExtensions.pdf: "assets/images/pdf.jpg",
  FileExtensions.jpg: "assets/images/jpg.ico"
};

Map<String, FileExtensions> extensionMap = {
  ".jpg": FileExtensions.jpg,
  ".pdf": FileExtensions.pdf,
  ".docx": FileExtensions.docx
};

final dropDownKey = GlobalKey<FormState>();
//Sand box API

//https://api.sandbox.cloudconvert.com