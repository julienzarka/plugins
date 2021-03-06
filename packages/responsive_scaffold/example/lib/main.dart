import 'package:flutter/material.dart';

import 'package:responsive_scaffold/responsive_scaffold.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveScaffold.builder(
        scaffoldKey: _scaffoldKey,
        detailBuilder: (BuildContext context, int index, bool tablet) {
          return DetailsScreen(
            appBar: AppBar(
              elevation: 0.0,
              title: Text("Details"),
              actions: [
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    if (!tablet) Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            body: Container(
              child: Center(
                child: Text("Item: $index"),
              ),
            ),
          );
        },
        slivers: <Widget>[
          SliverAppBar(
            title: Text("App Bar"),
          ),
        ],
        // bottomNavigationBar: BottomAppBar(
        //   child: Container(
        //     height: 50.0,
        //     color: Colors.green,
        //   ),
        // ),
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(index.toString()),
          );
        },
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Snackbar!"),
            ));
          },
        ),
      ),
    );
  }
}
