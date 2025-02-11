import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SafeWebView extends StatefulWidget {
  final String url;

  const SafeWebView({required this.url, Key? key}) : super(key: key);

  @override
  _SafeWebViewState createState() => _SafeWebViewState();
}

class _SafeWebViewState extends State<SafeWebView> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(controller: _webViewController),
          Positioned(
            top: 40, // Position the back button at the top of the screen
            left: 10,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the HomeScreen
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
