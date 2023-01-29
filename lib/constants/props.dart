import 'package:file_converter/constants/enums.dart';
import 'package:flutter/material.dart';

const primaryColor = Colors.deepOrangeAccent;

// List<String> extensions = ["none", ".docx", ".pdf", ".jpg"];

Map<FileExtensions, String> icons = {
  FileExtensions.docx: "assets/images/docx.jpg",
  FileExtensions.pdf: "assets/images/pdf1.png",
  FileExtensions.jpg: "assets/images/jpg.ico"
};

Map<String, FileExtensions> extensionMap = {
  ".jpg": FileExtensions.jpg,
  ".pdf": FileExtensions.pdf,
  ".docx": FileExtensions.docx
};

final dropDownKey = GlobalKey<FormState>();
String apiKey =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNWNiMDY5M2UxMGEyNzVmM2Y5YjQ3YWIxYTk1YzIyMmMyYWFmNzUwMzY3Nzk2M2RkNzcwYTQ4MmZkZjFlMDhkMGQ3ZWRmYmRiZmFiOGQwZGQiLCJpYXQiOjE2NzQ3OTQ5MzkuNTMxNDQzLCJuYmYiOjE2NzQ3OTQ5MzkuNTMxNDQ1LCJleHAiOjQ4MzA0Njg1MzkuNTI4NDM0LCJzdWIiOiI2MTg2NTY4OCIsInNjb3BlcyI6WyJ1c2VyLnJlYWQiLCJ1c2VyLndyaXRlIiwidGFzay5yZWFkIiwidGFzay53cml0ZSIsIndlYmhvb2sucmVhZCIsIndlYmhvb2sud3JpdGUiLCJwcmVzZXQucmVhZCIsInByZXNldC53cml0ZSJdfQ.MnnsrM0LuPGe3IHsv2NUTMNK-plYD6kmikZ0jTG-CYn25bViDBOQmGUlDNWuKHhDI9Ai55h6aWidXm5ycvE-eVwLIvbiz32XrTFHjHyPFVIEmhsoJmNuXEu8Izx9bTnlgl7x84xx7Ptzt1QIQufr0HwLKQnvmCHREg18VVnrXQtQO1dd9yFBFLNznwZvvges1otkMh5E5iGk9W_NmJJZ1Q90tPeh5Ckykyy-q0ELS71utzFCZR5eKCfkXtWRPqEkMtOklyLzjrcqtG67rAs3ASb8scG8NQdVoNCUcXAzQ-9Y2DN6OfgVURcEE2MYer0wvTuhgpbctrFYrINMTi0SN45U9H0TiB26A14rTD5206hGeo-OE-GKM7ajgcdffZXShPPXaLaeaetjW41mISPvBcqXxSO1qnEOCH41ErFLMPDVLDocPrjangL9Wjij9pUZyNfTVq7tnOZC1NAetQSBHW8aae3Ws89gYtHi5JniMkk8GjKr4B8M26bBlrALwTkAl-2-anM8lxXOBuP2Qs8Xu2JD4s03XU2aWST9KNgCrrni5mZ7x_atnO6suTjIFd8UsYJdySXNDpzBZ_pIYHiJPR7siWXIrmplG4y1N00hUZOWon0pvDQgAw4eaX922eHt4E_WRZDZiwlVx2Vt6exUO77yVxtXr-mXSyrN16eDBSY";
//Sand box API

//https://api.sandbox.cloudconvert.com