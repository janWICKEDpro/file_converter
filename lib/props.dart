import 'package:file_converter/enums.dart';
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
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTQwNGZhNDFjMmQwN2Y2NjQ4YWZhMWZjOGQ0YTc2NWY0NzNmMDdhMTJkNDlmODgxMGFhZjc1NTYwYjMxMTY0NTBkMjZlZTIzYzQxMTY5ZmYiLCJpYXQiOjE2NzQ3NTY3NTQuNzYxMDA5LCJuYmYiOjE2NzQ3NTY3NTQuNzYxMDExLCJleHAiOjQ4MzA0MzAzNTQuNzU2OTksInN1YiI6IjYxNzgyMzc0Iiwic2NvcGVzIjpbInVzZXIucmVhZCIsInVzZXIud3JpdGUiLCJ0YXNrLnJlYWQiLCJ0YXNrLndyaXRlIiwid2ViaG9vay5yZWFkIiwid2ViaG9vay53cml0ZSIsInByZXNldC5yZWFkIiwicHJlc2V0LndyaXRlIl19.iom3Uu4Fhayl4F6IPdAAKn3Wgy_e8GOVznMV3KJgqEJyLO94Q_o68p_oOgMkKx0ijcMfPdt6ejQ_qpphhIbTorC-DuZZOdAeIh18eUpvSOk6YMbdP3vXd078kV5WmFTVDpcSjNpAAbQzEdOB6W97FW0mLKbtHWB5aE6e0MKpMCjNWDAir7uj_tclxlYVTYizdEKstqRqNDQcumUSL6ymRkz8i_Yj0IgkECb1plbbC9EEEF1mXXQDPHjfX9nBfH_8z5qByk3E1MJ8GVkgMIkkqs105WhKV7A7W0p8mSH65aq7gDBFkEQnK3S0etH7SnFbg-ZBwqO4h4ZVPlCBI58o_nLkoVxjD4RaIpccMTYuJOmt1-dAaZpL9-z7cQ8-c5Xz5g93t-9x1cKvjcbGyybOb6tugidtugqBMg-hg1j2rl4C16bJMmyTFi47cK9cMFQjU3G3Qck-729rtne3SRTxm2SlEF_1PPLIELLNjsMkjRA7-myqIN2nuqr2LVgdRIhZFRdFTCgYrpz-ViHkTi0pjEQMfJbzyxGShByX0Q6pSmHAvcDqzMB5AVSaKTL4yGT8WkFrAMgJjL6ExuRfkK6I_2ivzHY1DDxPhQoGU6vF1TKJXbltuuXgUUjCgDRug4kRcYXUaekaBPxDj6pdkfK4QGC9F6TbCGpWBUHdAvP6e6M";
//Sand box API

//https://api.sandbox.cloudconvert.com