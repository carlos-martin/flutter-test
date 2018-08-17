import 'package:flutter/material.dart';
import 'package:navigation_app/utilities/globalState.dart';
import 'package:navigation_app/utilities/tools.dart';

class Browser extends StatefulWidget {
  @override
  BrowserState createState() => BrowserState();
}

class BrowserState extends State<Browser> with RouteAware {

  GlobalState _state = GlobalState.instance;
  String _url = "";
  
  @override
  void initState() {
    if (_state.get(FIRSTACCESS) == null || _state.get(FIRSTACCESS)) {
      _state.set(FIRSTACCESS, false);
    }
    getUrlPreference().then(_updateUrl);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Browser"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text(_url),
          ),
          new ListTile(
            title: new RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text("Go to settings"),
            ),
          )
        ],
      )
    );
  }

  void _updateUrl(String url) {
    setState(() {
      this._url = url;
    });
  }
}
