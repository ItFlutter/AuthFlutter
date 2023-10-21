import 'package:first_project/core/function/fcmconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/test/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              child: Text("send Notification"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                controller.sendMessage("Hello", "How Are You?");
              },
            ),
          ),
          Center(
            child: MaterialButton(
              child: Text("unsubscribeFromTopic"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                unsubscribeFromTopic("user");
              },
            ),
          )
        ],
      ),
    );
  }
}
