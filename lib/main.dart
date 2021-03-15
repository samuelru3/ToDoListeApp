import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ToDo()));

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<String> products = ['Tomate', 'Käse', 'Lauch', 'Paprika' ,'Wein'];

  void addItem(String item) {
    setState(() {
      products.add(item);
    });
    Navigator.of(context).pop();
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
                  fontFamily: 'Open Sans' ,
                  color: Colors.black54
              ),
            ),
            title: Text('Neuen ToDo Punkt eingeben:'),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do-App"),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
      body:
      ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          return ToDoItem( products[i] );
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
  const ToDoItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 3),
      color: Colors.black45,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        tileColor: Colors.black54,
        leading: Checkbox(
          value: false,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black54),
        ),
        trailing: Icon(Icons.delete_outline),
      ),
    );
  }
}
