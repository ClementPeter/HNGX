import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color(0xFF607E6C));

class WebViewProfile extends StatefulWidget {
  const WebViewProfile({super.key});

  //final WebViewController? webViewController;
  // const WebViewProfile({this.webViewController, super.key});

  @override
  State<WebViewProfile> createState() => _WebViewProfileState();
}

class _WebViewProfileState extends State<WebViewProfile> {
  //set webview controller
  late final WebViewController webViewController;

  double loadingPercentage = 0;

  //initialize webview
  @override
  void initState() {
    // TODO: implement initState

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(kColorScheme.surface)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            print(progress);

            setState(() {
              loadingPercentage = progress.toDouble();
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (error) {},
          onNavigationRequest: (request) {
            if (!request.url.startsWith("https://github.com/ClementPeter")) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("https://github.com/ClementPeter"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Github Profile'),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: webViewController,
          ),
          if (loadingPercentage < 100)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: LinearProgressIndicator(
                  value: loadingPercentage / 100,
                ),
              ),
            )
        ],
      ),
    );
  }
}
