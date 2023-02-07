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
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzIxNDZlM2JiMDhiZDIwNDcxOTkwMmVlZWE3NDZkYzkwYjExM2UwMDM2ZDEzOGE5NThkOTQwZTZkZDRhZjk0ZDhiN2ZiYjU0MzIzYjQ4ZDUiLCJpYXQiOjE2NzUwODY1ODkuMDExMTc0LCJuYmYiOjE2NzUwODY1ODkuMDExMTc1LCJleHAiOjQ4MzA3NjAxODkuMDAxNzI4LCJzdWIiOiI2MTg2NTY4OCIsInNjb3BlcyI6WyJ1c2VyLnJlYWQiLCJ1c2VyLndyaXRlIiwidGFzay5yZWFkIiwidGFzay53cml0ZSIsIndlYmhvb2sucmVhZCIsIndlYmhvb2sud3JpdGUiLCJwcmVzZXQucmVhZCIsInByZXNldC53cml0ZSJdfQ.bm4SM3eX0_Df8tgg6WRGL3It3Mcao-xjG-qKsFsiAFD0EhF0VvImbFpJAT-aJx97cBMI39Kmf8OD2yyJojP8z83aw07r8z1uXZVr5eb4gxTi9y5Y7C-3-EoU4CskxYp1dWdPi7piY3fX8iY5yL-7DjKn2xlPnguOOPsizrKXzJxfF2stciTuNNRrmuzDX4kB84Jqk1ntDjaJAlwnV8egOhpjgJOWmA3sNDu-Nj9stxa-260UvFE9kD45f93OQFaLb-_Bjc5gNgzuvutdH3dknJ1uWwmlqv7LBD308uz5S2lXy13jZWzXE_mH2MA4VcDgoM0qdGgtg2gUFDceKvzqGKCRsWz3i9wXYRL1jchhqmGEXayD1lI_FOU7ZgiWZYvETTBbyO8YqFqJe-b3KTFiIE_7ckL6w05C6Z20voZAjfBWWWin1KU83PNtyHJY5j6QYNaCS8KO1PNleu1eCKKG8-RuDv60SRt4E8GG7u0Mujek_NSNgoAKubh2eK0Ibqn9_BWrJjcJ-47U1hkQqH0UGuhznuzPaNA7NdgJq6XPf10ztL2QNe2R_n_e7kizVicKQx3Oka-o9T2YeznmzzZCmQRclckoVYNcdLvZhfXrFk9xxLud6gEZEoe3xEBpP4MrT5-G1GiEedpPlz4Zq0pSJREbZcPndbc4VeKksBZS6l4";
