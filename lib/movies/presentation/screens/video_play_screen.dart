import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlayVideoScreen extends StatefulWidget {
  final String url;
  const PlayVideoScreen({super.key, required this.url});

  @override
  PlayVideoScreenState createState() => PlayVideoScreenState();
}

class PlayVideoScreenState extends State<PlayVideoScreen> {
  WebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        allowsInlineMediaPlayback: true,
        debuggingEnabled: true,
        userAgent: "",
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
      ),
    );
  }
}