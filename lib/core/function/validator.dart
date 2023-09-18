import 'package:get/get.dart';

String? validator(
    {required int min,
    required int max,
    required String type,
    required String value}) {
  if (value.isEmpty) {
    return "cannot be empty";
  }
  if (value.length < min) {
    return "cannot be less than $min";
  }
  if (value.length > max) {
    return "cannot be greater than $max";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "username not valid";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "email not valid";
    }
  }
  if (type == "phonenumber") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "phonenumber not valid";
    }
  }
}
