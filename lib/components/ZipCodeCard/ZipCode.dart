class ZipCode {
  ZipCode({this.code, this.city, this.stateCode});
  final String code;
  final String city;
  final String stateCode;

  String location() {
    return '$city, $stateCode'; 
  }

  ZipCode.fromMap(Map<String, dynamic> map)
      : code = map['code'],
        city = map['city'],
        stateCode = map['stateCode'];

  Map<String, dynamic> toMap() {
    return {
      'code': this.code,
      'city': this.city,
      'stateCode': this.stateCode,
    };
  }
}
