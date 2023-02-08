import 'package:file_converter/constants/enums.dart';
import 'package:flutter/material.dart';

const primaryColor = Colors.deepOrangeAccent;

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
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWJlY2I4OGE0NzMxMDc0ZGY3ODY5NzAyYzViZjMwZmFlMTNkYmMwNTNiMGJiMWE1MTEzZWU5ODQ1OWMzZWM5YTkwOWFiZTVkZTg0M2QzNTYiLCJpYXQiOjE2NzU4NTk5MTEuMDE4Nzg5LCJuYmYiOjE2NzU4NTk5MTEuMDE4NzkxLCJleHAiOjQ4MzE1MzM1MTEuMDEyNTU4LCJzdWIiOiI2MjA0NTY2OCIsInNjb3BlcyI6WyJ1c2VyLnJlYWQiLCJ1c2VyLndyaXRlIiwidGFzay5yZWFkIiwidGFzay53cml0ZSIsIndlYmhvb2sucmVhZCIsIndlYmhvb2sud3JpdGUiLCJwcmVzZXQud3JpdGUiLCJwcmVzZXQucmVhZCJdfQ.pfYewfDNha6ZE6xZ1Fwel3MN_dMJJf_Lrc8EsN9kb4DvAYZiAM_wD-P_8m7iOH54YaIEvl_5l3x6D9WXPtDW0kpgJDMiYLS3TQNf5uDVziMp7khu6HK_6aV1M42HHAVy5zXqHrZlhLz3yKP_MOCcsEJYZDZ8iITkIWEd8PR5LiZW5kXYkZoru8b1YENpeccpnPFFtWhM6FRXqdHbnitwzG5e52AfChJ73B8vYvwPJLVEpZOg_nPqLs7V43acdnvz46sihELNkvR7APHYHcpj_R2j2-GNuV7AbX489vqCuYQ7Vv5F2w94D5jpk9oGf0GzTQ5zHvBDlfMKKvnASk3tj_lRr2U46f9FSL_9j0JZ9EBVN1imRYaQZGlrN8TJmJrd8UwxcasyjxyuB4fZ_169XdDao2tX2GDJFqmCZ5Jv9bEBdiry2__-u17E2mtK2I3GLbMvUEib0DapBJvyhmYIP8fbvbMtxNifrdXPAjZCRmutLRO_TB5Qqggt4iwPATRH8On6PE3nFvdYtGf6yzmoDa67R2Zm8-Mx9ak4s8AWvnmSij44dIwNl6rOfL4O70Qu8-s0Kkn9qkMO21JQqFDbGIGm-A88i-K-ZEsoam2T3-xf9YQyH7utXk7EoNgXfgp6wdtI2H4kANBZ5O0eS5GKeRdbRnzbAexhvBhL_AJzk2o";
