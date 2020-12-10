import 'package:flutter/material.dart';


class FormPage extends StatelessWidget {
  FormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new ZIP-code'),
      ),
      body: Text('Form is displayed here'),
    );
  }
}

