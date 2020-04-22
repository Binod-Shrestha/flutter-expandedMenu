import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

//MARK: a new class to hold information
class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;
//MARK: constructor
  MyItem(this.isExpanded, this.header, this.body);
}

class _MyAppState extends State<MyApp> {
//MARK: making list
  List<MyItem> _items = List<MyItem>();

  @override
  void initState() {
    for (int i = 0; i < 15; i++) {
      _items.add(
        new MyItem(
          false,
          'Item $i',
          Container(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text('Name $i'),
              trailing: Icon(Icons.account_circle),
              leading: Icon(Icons.add_call),
            ),
          ),
        ),
      );
    }
  }

  //MARK: creating expansion panel
  ExpansionPanel _createExapnsionPanel(MyItem item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          padding: EdgeInsets.all(5.0),
          child: Text('Conact ${item.header}'),
        );
      },
      body: item.body,
      isExpanded: item.isExpanded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange,
          textTheme: TextTheme(body1: TextStyle(fontSize: 24.0))),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exapnded Menu'),
        ),
        body: Container(
          padding: EdgeInsets.all(
            12.0,
          ),
          child: Center(
            child: ListView(
              children: <Widget>[
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _items[index].isExpanded = !_items[index].isExpanded;
                    });
                  },
                  children: _items.map(_createExapnsionPanel).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
