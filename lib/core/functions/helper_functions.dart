import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyText(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("تم نسخ الذكر")),
    );
  }