import 'package:flutter/material.dart';


class SearchForm extends StatefulWidget {
  SearchForm({Key key}) : super(key: key);

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'City*',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please fill in this field';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'State code*',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please fill in this field';
              }
              if (value.length > 2) {
                return 'State code must not contain more than 2 letters';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Find ZIP-code'),
            ),
          ),
        ],
      ),
    );
  }
}
