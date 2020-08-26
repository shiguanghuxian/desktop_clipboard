
import 'dart:async';

import 'package:flutter/services.dart';

class DesktopClipboard {
  static const MethodChannel _channel =
      const MethodChannel('desktop_clipboard');

  static Future<String> get getClipboardText async {
    String txt = "";
    try {
      txt = await _channel.invokeMethod('getClipboardText');
    } on PlatformException {
      print("桌面获取剪切板内容错误");
    }
    return txt;
  }

  static Future<bool> setClipboardText(String txt) async {
    bool ok = false;
    try {
      final String result = await _channel.invokeMethod('setClipboardText', <String, dynamic>{
        "txt": txt,
      });
      ok = result == "ok";
    } on PlatformException {
      print("错误");
    }
    return ok;
  }

}
