import 'package:flutter/material.dart';
import './SearchForm.dart';
import '../../components/ZipCodeCard/ZipCodeCard.dart';
import '../../components/ZipCodeCard/ZipCode.dart';


class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}


class _FormPageState extends State<FormPage> {
  final List<ZipCode> _zipCodes = [
    new ZipCode(code: '123', city: 'Ohio', stateCode: 'OH')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new ZIP-code'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          children: <Widget>[
            SearchForm(),
            Expanded(
              child: ListView(
                children: _zipCodes.map((ZipCode zipCode) => ZipCodeCard(zipCode: zipCode)).toList()
              ),
            )
          ]
        )
      ),
    );
  }
}

