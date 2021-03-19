import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ToDo()));

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<String> products = ['Tomate', 'Käse', 'Lauch', 'Paprika', 'Wein'];

  void addItem(String item) {
    setState(() {
      products.add(item);
    });
    Navigator.of(context).pop();
  }

  void deleteItem(int key){
    setState(() {
      products.remove(key);
    });
  }

  void newEntry() {
    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: TextField(
              autofocus: true,
              cursorColor: Color.fromRGBO(45, 4, 54, 54),
              maxLength: 50,
              cursorWidth: 1.5,
              autocorrect: true,
              autofillHints: products,
              obscureText: false,
              obscuringCharacter: '€',
              onSubmitted: addItem,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Open Sans',
                  color: Colors.black54),
            ),
            title: Text('Neuen ToDo Punkt eingeben:'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("Samuel's To-Do-App"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          return ToDoItem(
              products[i],
              () => deleteItem(i),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newEntry,
        child: Icon(Icons.add),
      ),
    );
  }
}

class ToDoItem extends StatelessWidget {
  final String title;
  const ToDoItem(this.title, this.remove);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 3),
      //color: Colors.blue[200],
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        tileColor: Colors.blue[800],
        leading: Checkbox(
          value: false,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () => remove(),
        )
      ),
    );
  }
}
