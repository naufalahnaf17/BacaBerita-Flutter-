import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Content extends StatelessWidget {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: WebviewScaffold(
            url: data['url'],
            withJavascript: true,
        ),
      )
    );
  }
}
