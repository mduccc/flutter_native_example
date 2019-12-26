import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String _title = 'Flutter with Native';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyHomePage(_title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String _title;

  MyHomePage(this._title);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BasicMessageChannel _channel =
      BasicMessageChannel<String>('msg', StringCodec());
  final String _msg = "I'm Flutter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Center(
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () async {
                    String response = await _channel.send(_msg);
                    print(response);
                  },
                  child: Text(
                    'Send to Native',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text('Messenge from Native'),
              ))
        ],
      ),
    );
  }
}
