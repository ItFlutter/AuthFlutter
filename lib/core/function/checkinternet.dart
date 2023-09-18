import 'dart:io';

Future<bool> checkinternet() async {
  try {
    List<InternetAddress> response = await InternetAddress.lookup("google.com");

    if (response[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
