import 'package:flutter/material.dart';
import '../FormPage/FormPage.dart';


class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ziplock'),
      ),
      body: Text('Nothing interesting here yet'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormPage())
        ),
        tooltip: 'Add zip-code',
        child: Icon(Icons.add),
      ),
    );
  }
}

