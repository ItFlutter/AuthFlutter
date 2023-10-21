import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_project/core/constant/routes.dart';
import 'package:get/get.dart';

fcmForgroundConfig() {
  print(
      "=================================================Notification Listening");

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // print(message.category);
    // print(message.collapseKey);
    // print(message.contentAvailable);
    print(message.data);
    print(message.data['pageid']);
    print(message.data['pagename']);
    print(message.data['url']);
    print(message.data['dl']);
    // print(message.from);
    // print(message.messageId);
    // print(message.messageType);
    // print(message.mutableContent);
    // print(message.notification);
    // print(message.senderId);
    // print(message.sentTime);
    // print(message.threadId);
    // print(message.ttl);

    print(
        "=================================================Notification Arrived Forground");
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print(
          "======================================================================");
      print(message.notification!.title);
      print(message.notification!.body);
      // print(message.notification!.android);
      // print(message.notification!.apple);
      // print(message.notification!.bodyLocArgs);
      // print(message.notification!.bodyLocKey);
      // print(message.notification!.titleLocArgs);
      // print(message.notification!.titleLocKey);
      // print(message.notification!.web);
      // print(message.notification!.android!.channelId);
      // print(message.notification!.android!.clickAction);
      // print(message.notification!.android!.count);
      // print(message.notification!.android!.imageUrl);
      // print(message.notification!.android!.link);
      // print(message.notification!.android!.priority);
      // print(message.notification!.android!.smallIcon);
      // print(message.notification!.android!.sound);
      // print(message.notification!.android!.tag);
      // print(message.notification!.android!.ticker);
      // print(message.notification!.android!.visibility);
      // print(message.notification!.android!.color);
      print(
          "======================================================================");
    }
  });
}

myrequestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("====================================================");
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print("====================================================");

    print('User granted provisional permission');
  } else {
    print("====================================================");

    print('User declined or has not accepted permission');
  }
}

getToken() async {
  String? myToken = await FirebaseMessaging.instance.getToken();
  print(
      "=================================================================myToken");
  print(myToken);
}
// FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   print('Got a message whilst in the foreground!');
//   print('Message data: ${message.data}');

//   if (message.notification != null) {
//     print('Message also contained a notification: ${message.notification}');
//   }
// });
fcmBackgroundAndTerminatedConfig() {
  FirebaseMessaging.onBackgroundMessage(backgroundMessage);
}

Future<void> backgroundMessage(RemoteMessage message) async {
  print(
      "=================================================Notification Arrived Background");
  if (message.notification != null) {
    print(
        "======================================================================");
    print(message.notification!.title);
    print(message.notification!.body);
    // print(message.notification!.android!.imageUrl);

    // print(message.notification!.android!.channelId);
    // print(message.notification!.android!.clickAction);
    // print(message.notification!.android!.color);
    // print(message.notification!.android!.count);
    // print(message.notification!.android!.imageUrl);
    // print(message.notification!.android!.link);
    // print(message.notification!.android!.priority);
    // print(message.notification!.android!.smallIcon);
    // print(message.notification!.android!.sound);
    // print(message.notification!.android!.tag);
    // print(message.notification!.android!.ticker);
    // print(message.notification!.android!.visibility);
    print(
        "======================================================================");
  }
}

onClickNotificationBackground() {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("====================================onClickNotificationBackground");
    print("${message.notification!.title}");
    print("${message.notification!.body}");
    if (message.data['type'] == "homepage") {
      Get.toNamed(AppRoute.homepage);
    }
  });
}

Future<void> onClickNotificationTerminated() async {
  RemoteMessage? message;
  message = await FirebaseMessaging.instance.getInitialMessage();
  if (message != null) {
    print(
        "==========================terminated=================================");
    Get.toNamed(AppRoute.signup);
  }
  onClickNotificationBackground();
}

subscribeToTopic(String topic) async {
  print("==============================================================");
  print(
      "===========================Sunscribe To Topic ${topic}===================================");
  await FirebaseMessaging.instance.subscribeToTopic(topic);
}

unsubscribeFromTopic(String topic) async {
  print("==============================================================");
  print(
      "===========================Unsunscribe To Topic ${topic}===================================");
  await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
}
