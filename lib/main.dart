import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_shopping_list/shopping_list_controller.dart';

ShoppingListController shoppingListController = new ShoppingListController();

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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: SafeArea(
        child: Container(
          child: Observer(
            builder: (_) => ListView.builder(
              itemBuilder: (_, i) => Card(
                child: ListTile(
                  title: Text(shoppingListController.getItem(i)),
                  trailing:
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.edit),
                        tooltip: 'Edit item',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditItemScreen(
                                    text: shoppingListController.getItem(i),
                                    position: i)),
                          );
                        }),
                    IconButton(
                        icon: Icon(Icons.delete),
                        tooltip: 'Delete item',
                        onPressed: () {
                          shoppingListController.deleteItem(i);
                        }),
                  ]),
                ),
              ),
              itemCount: shoppingListController.getSize(),
            ),
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

class EditItemScreen extends StatelessWidget {
  final textEditingController = TextEditingController();
  final String text;
  final int position;

  EditItemScreen({this.text, this.position}) {
    textEditingController.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Item"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: "Item name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.isNotEmpty) {
                      shoppingListController.editItem(
                          textEditingController.text, position);
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Done'))
            ],
          ),
        ),
      ),
    );
  }
}

class AddNewItemScreen extends StatelessWidget {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: 'Add your new Item',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.isNotEmpty) {
                      shoppingListController
                          .addItem(textEditingController.text);
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}
