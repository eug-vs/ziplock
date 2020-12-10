import 'package:flutter/material.dart';
import './SearchForm.dart';


class FormPage extends StatelessWidget {
  FormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new ZIP-code'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: SearchForm()
      ),
    );
  }
}

