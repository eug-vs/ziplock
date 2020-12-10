import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  FormPage({Key key }) : super(key: key);

  State<StatefulWidget> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new zip-code'),
      ),
      body: Center(
        child: Text('Form is displayed here')
      )
    );
  }
}
