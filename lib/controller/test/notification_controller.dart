import 'dart:convert';

import 'package:first_project/core/function/fcmconfig.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  sendMessage(String title, String body) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAA9NBsBIs:APA91bGlHm_ds-26Ajlu6_xvGoyham0pkGMPJ7vLZY5ifmV5Qc9cCyeuJZaeB5A-BemH8HVMbIm0rlZTF5Js0qYiVob1adppe8Y00AaXEEvgs0dbUigeFXiFchVx4Tw2Fi9W7u7ZJMDD'
    };
    var request =
        http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.body = json.encode({
      // "to":
      //     "fJ-e8v2VQtGjECmolWg96U:APA91bHb2rOibfd36EBxPGi0rKV4bJd-XINMRe_3jOMPA_JY_2qzKAkADhYUsQ-8a_wKKdszVkHozBvSfvypOVzKj31SeE_V9mmdM6KqkXqzXouz2n4xV8RMSSFwZ_jHxQ-t8DO9Rx-8",
      "to": "/topics/user",
      "notification": {
        "title": title,
        "body": body,
        // "mutable_content": true,
        "sound": "Tri-tone",
        // 'priority': 'high',
        // 'content_available': true,
        "click_action": "FLUTTER_NOTIFICATION_CLICK",

        // 'color': 'red',
        // 'link': 'https://www.google.com/',
        // 'tag': '#a1',
        // "imageUrl":
        //     "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80",
      },
      "data": {
        "pageid": "pageid",
        "pagename": "pagename",
        "url": "<url of media image>",
        "dl": "<deeplink action on tap of notification>"
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void onInit() {
    subscribeToTopic("user");
    // TODO: implement onInit
    super.onInit();
  }
}
