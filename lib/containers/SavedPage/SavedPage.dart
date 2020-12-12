import 'dart:convert';
import 'package:flutter/material.dart';
import '../../components/ZipCodeCard/ZipCodeCard.dart';
import '../../components/ZipCodeCard/ZipCode.dart';
import '../../DatabaseService.dart';

class SavedPage extends StatefulWidget {
  SavedPage({Key key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}


class _SavedPageState extends State<SavedPage> {
  List<ZipCode> _zipCodes = [];

  @override
  void initState() {
    super.initState();
    DatabaseService.db
      .listZipCodes()
      .then((List<ZipCode> results) {
        setState(() => {
          _zipCodes = results
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved ZIP-codes'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: ListView(
          children: _zipCodes.map((ZipCode zipCode) => ZipCodeCard(zipCode: zipCode)).toList()
        ),
      ),
    );
  }
}

