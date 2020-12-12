import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './SearchForm.dart';
import '../../components/ZipCodeCard/ZipCodeCard.dart';
import '../../components/ZipCodeCard/ZipCode.dart';

// TODO: load from env? Wtf, where do they even store these on mobile?
final API_BASE_URL = 'https://www.zipcodeapi.com/rest';
final API_TOKEN = 'VtTFmXpCWVRjqbJ8sV2fmNYH4ciX2gyyPZonHX8dkjeE8sLYhr3ZwtyiuZVWBw6a';


class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}


class _FormPageState extends State<FormPage> {
  List<ZipCode> _zipCodes = [];

  // TODO: implement pagination (if API supports it)
  Future<void> fetchZipCodes(String city, String stateCode) async {
    final requestUrl = '$API_BASE_URL/$API_TOKEN/city-zips.json/$city/$stateCode';
    print('Fetching $requestUrl');
    final response = await get(requestUrl);
    if (response.statusCode == 200) {
      setState(() {
        _zipCodes = List<String>
            .from(jsonDecode(response.body)['zip_codes'])
            .map((String code) => new ZipCode(code: code, city: city, stateCode: stateCode))
            .toList();
      });
    } else {
      throw Exception('Failed to fetch zip-codes');
    }
  }

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
            SearchForm(handleSubmit: fetchZipCodes),
            _zipCodes.length > 0 ? Expanded(
              child: ListView(
                children: _zipCodes.map((ZipCode zipCode) => ZipCodeCard(zipCode: zipCode)).toList()
              ),
            ) : Text('Try something like [New York, NY] or [Phoenix, AZ]'),
          ]
        )
      ),
    );
  }
}

