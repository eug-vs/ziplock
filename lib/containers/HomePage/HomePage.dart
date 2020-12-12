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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Ziplock is an application to manage your zip-codes.'),
            ElevatedButton(
              child: const Text('My collection'),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SavedPage())
              ),
            ),
          ],
        ),
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

