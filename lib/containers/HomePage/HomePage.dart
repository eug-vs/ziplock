import 'package:flutter/material.dart';
import '../FormPage/FormPage.dart';
import '../SavedPage/SavedPage.dart';


class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ziplock'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Ziplock is an application to manage your zip-codes.'),
          TextButton(
            child: const Text('My collection'),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavedPage())
            ),
          ),
        ],
      ),
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

