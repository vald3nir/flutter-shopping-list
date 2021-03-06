import 'package:flutter/material.dart';
import 'package:flutter_shopping_list/add_new_item_screen.dart';
import 'package:flutter_shopping_list/edit_item_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Shopping List'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title!),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text('One-line with leading widget'),
                  trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[Icon(Icons.edit), Icon(Icons.delete)]),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewItemScreen()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
