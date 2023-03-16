import 'dart:io';

import 'package:flutter/material.dart';
import 'package:picktask/utils/color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewQuests extends StatefulWidget {
  final String title;
  final String url;
  const WebViewQuests({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  State<WebViewQuests> createState() => _WebViewQuestsState();
}

class _WebViewQuestsState extends State<WebViewQuests> {
  late final WebViewController _webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          // if (request.url.startsWith('https://www.youtube.com/')) {
          //   return NavigationDecision.prevent;
          // }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(widget.url));

  double progress = 0;
  @override
  void initState() {
    // if (Platform.isAndroid) {
    //   WebView.platform = SurfaceAndroidWebView();
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBalckColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close_sharp,
              size: 25,
            )),
        backgroundColor: kBalckColor,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: kPrimaryColor,
          ),
          Expanded(
              child: WebViewWidget(
                controller: _webViewController,

          )),
        ],
      ),
    );
  }
}
