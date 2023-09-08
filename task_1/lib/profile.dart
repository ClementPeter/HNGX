import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Profile extends StatefulWidget {
  final WebViewController? webViewController;
  const Profile({this.webViewController, super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Profile'),
      ),
      body: WebViewWidget(controller: widget.webViewController!),
    );
  }
}
