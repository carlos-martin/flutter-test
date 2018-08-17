import 'package:flutter/material.dart';
import 'package:navigation_app/utilities/globalState.dart';
import 'package:navigation_app/utilities/tools.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> with RouteAware {

  GlobalState _state = GlobalState.instance;
  String _urlString;
  TextEditingController _url;

  @override
  void initState() {
    if (_state.get(FIRSTACCESS) == null) {
      _state.set(FIRSTACCESS, true);
    }
    getUrlPreference().then(_updateData);
    super.initState();
  }

  void _updateData(String url) {
    _url = new TextEditingController();
    if (url == null) {
      _urlString = '';
      setState(() {
        _url.text = _urlString;
      });
    } else {
      _urlString = url;
      setState(() {
        _url.text = _urlString;
        if (_state.get('firstAccess')) {
          Navigator.of(context).pushNamed('/Browser');
        }
      });
    }

  }

  void _saveUrl() {
    String newUrl = _url.text;
    saveUrlPreference(newUrl).then((bool committed) {
      Navigator.of(context).pushNamed('/Browser');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Settings"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _url,
              decoration: new InputDecoration(
                labelText: 'Enter an URL',
              ),
            ),
          ),
          new ListTile(
            title: new RaisedButton(
              //onPressed: _onPressed,
              onPressed: (){
                // TODO: Save the name
                _saveUrl();
              },
              child: new Text("Go to browser"),
            ),
          )
        ],
      ),
    );
  }

}