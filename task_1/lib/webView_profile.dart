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
  bool isError = false;

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
            print("progress::$progress::");
            setState(() {
              loadingPercentage = progress.toDouble();
            });
          },
          onPageFinished: (url) {
            print("url::$url::");
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (error) {
            print("error::${error.errorCode}::");
            if (error.errorCode != 200 || error.errorCode != 201) {
              setState(() {
                isError = true;
              });
            } else {
              setState(() {
                isError = false;
              });
            }
          },
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

  // showDialog(){
  //   showDialog(context: BuildContext context, builder: builder)

  // }
  // Widget showErrorDialog(){
  //   return showDialog(context: context, builder:(context) {
  //       AlertDialog(
  //       title: Text('Url Error or Erro loading Url'),
  //     );
  //   },);
  // }

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
                  value: loadingPercentage,
                ),
              ),
            ),
          if (isError == true)
            const AlertDialog(
              title: Center(
                child: Text(
                  'Oops...Error while loading Url',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
