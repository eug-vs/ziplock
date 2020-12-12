import 'package:flutter/material.dart';
import './ZipCode.dart';
import '../../DatabaseService.dart';

// TODO: make stateful?
class ZipCodeCard extends StatefulWidget {
  ZipCodeCard({Key key, this.zipCode}) : super(key: key);
  final ZipCode zipCode;

  @override
  _ZipCodeCardState createState() => _ZipCodeCardState();

}


class _ZipCodeCardState extends State<ZipCodeCard> {
  bool _isSaved = true;

  @override
  void initState() {
    super.initState();
    DatabaseService.db
      .isZipCodeSaved(widget.zipCode.code)
      .then((bool result) {
        setState(() => {
          _isSaved = result
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListTile(
          leading: Icon(Icons.location_on),
          title: Text(widget.zipCode.code),
          subtitle: Text(widget.zipCode.location()),
          trailing: _isSaved ? null : TextButton(
            child: Text('Save'),
            onPressed: () async {
              final id = await DatabaseService.db.insertZipCode(widget.zipCode);
              setState(() => {
                _isSaved = true
              });
              print('Zip code saved to local database with id $id');
            },
          ),
        )
      ),
    );
  }
}
