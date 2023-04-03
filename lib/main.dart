import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:picktask/constants/key_constants.dart';
import 'package:picktask/controller/onboarding/onboarding_controller.dart';
import 'package:picktask/screens/onboarding/splash.dart';
import 'package:picktask/utils/utils.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

AndroidNotificationChannel? channel;

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
late FirebaseMessaging messaging;

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void notificationTapBackground(NotificationResponse notificationResponse) {
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}



Future<Uint8List> _getByteArrayFromUrl(String url) async {
  final http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

void main() async {
  runZonedGuarded(() async {
    //for register services
    await GetStorage.init();
    WidgetsFlutterBinding.ensureInitialized();
    // System overlay used for change the app status bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    await Firebase.initializeApp();

    messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    //If subscribe based sent notification then use this token
    final fcmToken = await messaging.getToken();
    print("firebase token::: $fcmToken");
    await storage.write(KeyConstants.firebaseTokenKey, fcmToken);
    //If subscribe based on topic then use this
   // await messaging.subscribeToTopic('flutter_notification');

    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
          'flutter_notification', // id
          'flutter_notification_title', // title
          importance: Importance.high,
          enableLights: true,
          enableVibration: true,
          showBadge: true,
          playSound: true);

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      final android =
      AndroidInitializationSettings('@drawable/ic_notifications_icon');
      final iOS = DarwinInitializationSettings();
      final initSettings = InitializationSettings(android: android, iOS: iOS);

      await flutterLocalNotificationsPlugin!.initialize(initSettings,
          onDidReceiveNotificationResponse: notificationTapBackground,
          onDidReceiveBackgroundNotificationResponse: notificationTapBackground);

      await messaging
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    runApp(const Picktask());
    OnboardingController();
  }, (error, stack) {
    print('main error - $error');
    print('main stack - $stack');
  }, zoneSpecification: const ZoneSpecification());
}


var storage = GetStorage();
class Picktask extends StatefulWidget {
  const Picktask({Key? key}) : super(key: key);

  @override
  _PicktaskState createState() => _PicktaskState();
}

class _PicktaskState extends State<Picktask> {


  @override
  void initState() {
    super.initState();

    setupInteractedMessage();

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) async {
      RemoteNotification? notification = message?.notification!;

      print(notification != null ? notification.title : '');
    });

    FirebaseMessaging.onMessage.listen((message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null && !kIsWeb) {
        String action = jsonEncode(message.data);
        // final String largeIconPath =
        // await Utils.downloadAndSaveFile('https://dummyimage.com/48x48', 'largeIcon');
        final String bigPicturePath = await Utils.downloadAndSaveFile(
            notification.android?.imageUrl??"", 'bigPicture');
        final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
            FilePathAndroidBitmap(bigPicturePath),
            hideExpandedLargeIcon: true,
            contentTitle: '<b>${notification.title}</b>',
            htmlFormatContentTitle: true,
            summaryText: notification.body,
            htmlFormatSummaryText: true);


        flutterLocalNotificationsPlugin!.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                priority: Priority.high,
                importance: Importance.max,
                setAsGroupSummary: true,
                styleInformation: bigPictureStyleInformation,
               // largeIcon:  FilePathAndroidBitmap(largeIconPath),
                channelShowBadge: true,
                autoCancel: true,
                icon: '@drawable/ic_notifications_icon',
              ),
            ),
            payload: action);
      }
      print('A new event was published!');
      print('Handling a background message ${message.toMap()}');
    });

    FirebaseMessaging.onMessageOpenedApp
        .listen((message) => _handleMessage(message.data));
  }

  Future<dynamic> onSelectNotification(payload) async {
    Map<String, dynamic> action = jsonDecode(payload);
    _handleMessage(action);
  }

  Future<void> setupInteractedMessage() async {
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then((value) => _handleMessage(value != null ? value.data : Map()));
  }

  void _handleMessage(Map<String, dynamic> data) {
    if (data['redirect'] == "splash") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Spalsh()));
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(backgroundColor: Colors.black)),
        title: "Picktask",
        home: const Spalsh());
  }
}
