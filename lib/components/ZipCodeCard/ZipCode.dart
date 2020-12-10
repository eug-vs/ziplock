class ZipCode {
  ZipCode({this.code, this.city, this.stateCode});
  final String code;
  final String city;
  final String stateCode;

  String location() {
    return '$city, $stateCode'; 
  }
}
