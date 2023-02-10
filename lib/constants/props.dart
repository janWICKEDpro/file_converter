import 'package:file_converter/constants/enums.dart';
import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 185, 81, 49);

const Map<FileExtensions, String> icons = {
  FileExtensions.docx: "assets/images/docx.ico",
  FileExtensions.pdf: "assets/images/pdf.ico",
  FileExtensions.jpg: "assets/images/jpg.ico"
};

const Map<String, FileExtensions> extensionMap = {
  "jpg": FileExtensions.jpg,
  "pdf": FileExtensions.pdf,
  "docx": FileExtensions.docx,
  "png": FileExtensions.png
};

const Map<FileExtensions, String> reverseExtensionMap = {
  FileExtensions.jpg: "jpg",
  FileExtensions.pdf: "pdf",
  FileExtensions.docx: "docx",
  FileExtensions.png: "png"
};

final dropDownKey = GlobalKey<FormState>();
String apiKey =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmZkZWI1OGMwZTZkNzg3ZmFjMTg1NzY2Nzg0ZjRlZDExOGY5MGZhNjRlMGQwMzFhNjdjM2ZmODMyMDg3OTI1ODIyYzlhYmY1OTQxZjBlMDciLCJpYXQiOjE2NzYwMTU0ODYuMDU5NzUsIm5iZiI6MTY3NjAxNTQ4Ni4wNTk3NTEsImV4cCI6NDgzMTY4OTA4Ni4wNTM4OTUsInN1YiI6IjYyMDQ1NjY4Iiwic2NvcGVzIjpbInVzZXIucmVhZCIsInVzZXIud3JpdGUiLCJ0YXNrLnJlYWQiLCJ0YXNrLndyaXRlIiwid2ViaG9vay5yZWFkIiwid2ViaG9vay53cml0ZSIsInByZXNldC5yZWFkIiwicHJlc2V0LndyaXRlIl19.UF2gXK7qf7w1GqkdV_GiQqqWFquVfN-k-UWSG35Pz6EGvgHy-eP9ljSkpkOWUtsNgod37aUEnVAElqfaf3_i1JJaNDrFSc975WdYACit0aYm7tcP_iNuSPxm8Mxe0OeumfICbMGOF2qqWp1Kiw2mTxJNhAXp2kLFULxcKgBoDBcWJq7DpedRUe-HWytn6saEWzMpD3hj_onWqfmABYPE5gR7iJb8aaHIMVu_b1Ciqg5ECaM7CI3SBaXBpm3fwEUEwY9mxEOLSDvpMN_GluJ714woqR3B6WOWrhFKZ4FiqPWwKj1ju8L4smaA17bJB_yM8E_Ok6oKl-SfdtvSZWiRiWSsQ9hpk-rcMlXkjaP6WA4ATDuBS-lHNo4fsE1AlcLM0xZlX5VIfbLVG7fdlU8OkIiWKaLZnamawvvX2XlxWMY3VXcSJNI-LH9GcM6nVPomlwLwqrwKAFGPGv_hVVgRrl_1gPNBS_T65q-KVBzXEuOMZbNxs1Qy42FF_Kdp4CvdHqkmBQrbJqmX_s2Cm0SuPshCQ-8GDsEMAmskTVCWoXKy46LShhSMSofohNL_NLzw7zDfevFoUVLrEHpBBx2RQsPvQlEmVUICutN3MrKlXNBZWURt-1B3jlLZ3yMEZU91vKWSJ_OSmWJ5FQc3GPLNfU9kA9iRh-ik5H5wORJAvZc";
