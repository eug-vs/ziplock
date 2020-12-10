import 'package:flutter/material.dart';
import './ZipCode.dart';

// TODO: make stateful?
class ZipCodeCard extends StatelessWidget {
  ZipCodeCard({Key key, this.zipCode}) : super(key: key);

  final ZipCode zipCode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListTile(
          leading: Icon(Icons.location_on),
          title: Text(this.zipCode.code),
          subtitle: Text(this.zipCode.location()),
          trailing: TextButton(
            child: const Text('Save'),
            onPressed: () {
              // TODO: handle press
            },
          ),
        )
      ),
    );
  }
}
