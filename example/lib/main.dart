import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:desktop_clipboard/desktop_clipboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // 获取粘贴板内容
  Future<void> getClipboardText() async {
    String txt = await DesktopClipboard.getClipboardText;
    print('获取粘贴板内容：' + txt);
  }

  // 设置粘贴板内容
  Future<void> setClipboardText() async {
    bool ok =
        await DesktopClipboard.setClipboardText(DateTime.now().toString());
    print('写入板内容：' + (ok ? '成功' : '失败'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            MaterialButton(
              child: Text('获取粘贴板内容'),
              onPressed: () {
                getClipboardText();
              },
            ),
            MaterialButton(
              child: Text('设置粘贴板内容'),
              onPressed: () {
                setClipboardText();
              },
            ),
          ],
        ),
      ),
    );
  }
}
