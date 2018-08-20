import 'package:flutter/material.dart';
import 'package:navigation_app/utilities/globalState.dart';
import 'package:navigation_app/utilities/tools.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const userAgent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

class Browser extends StatefulWidget {
  @override
  BrowserState createState() => BrowserState();
}

class BrowserState extends State<Browser> with RouteAware {

  GlobalState _state = GlobalState.instance;
  String _url = "";

  final webView = FlutterWebviewPlugin();

  
  @override
  void initState() {
    if (_state.get(FIRSTACCESS) == null || _state.get(FIRSTACCESS)) {
      _state.set(FIRSTACCESS, false);
    }
    getUrlPreference().then(_updateUrl);

    super.initState();
  }

  @override
  void dispose() {
    webView.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: _url,
      appBar: new AppBar(
        title: Text(_url),
      ),
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
      userAgent: userAgent,
    );
  }

  void _updateUrl(String url) {
    setState(() {
      this._url = url;
      this.webView.reloadUrl(url);
    });
  }
}
